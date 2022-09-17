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
      ?auto_17900 - PERSON
      ?auto_17899 - CITY
    )
    :vars
    (
      ?auto_17901 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_17900 ?auto_17901 ) ( AIRCRAFT-AT ?auto_17901 ?auto_17899 ) )
    :subtasks
    ( ( !DEBARK ?auto_17900 ?auto_17901 ?auto_17899 )
      ( FLY-1PPL-VERIFY ?auto_17900 ?auto_17899 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_17912 - PERSON
      ?auto_17911 - CITY
    )
    :vars
    (
      ?auto_17913 - AIRCRAFT
      ?auto_17916 - CITY
      ?auto_17914 - FLEVEL
      ?auto_17915 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_17912 ?auto_17913 ) ( AIRCRAFT-AT ?auto_17913 ?auto_17916 ) ( FUEL-LEVEL ?auto_17913 ?auto_17914 ) ( NEXT ?auto_17915 ?auto_17914 ) ( not ( = ?auto_17911 ?auto_17916 ) ) ( not ( = ?auto_17914 ?auto_17915 ) ) )
    :subtasks
    ( ( !FLY ?auto_17913 ?auto_17916 ?auto_17911 ?auto_17914 ?auto_17915 )
      ( FLY-1PPL ?auto_17912 ?auto_17911 )
      ( FLY-1PPL-VERIFY ?auto_17912 ?auto_17911 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_17933 - PERSON
      ?auto_17932 - CITY
    )
    :vars
    (
      ?auto_17935 - AIRCRAFT
      ?auto_17936 - CITY
      ?auto_17934 - FLEVEL
      ?auto_17937 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17935 ?auto_17936 ) ( FUEL-LEVEL ?auto_17935 ?auto_17934 ) ( NEXT ?auto_17937 ?auto_17934 ) ( not ( = ?auto_17932 ?auto_17936 ) ) ( not ( = ?auto_17934 ?auto_17937 ) ) ( PERSON-AT ?auto_17933 ?auto_17936 ) )
    :subtasks
    ( ( !BOARD ?auto_17933 ?auto_17935 ?auto_17936 )
      ( FLY-1PPL ?auto_17933 ?auto_17932 )
      ( FLY-1PPL-VERIFY ?auto_17933 ?auto_17932 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_17954 - PERSON
      ?auto_17953 - CITY
    )
    :vars
    (
      ?auto_17956 - AIRCRAFT
      ?auto_17958 - CITY
      ?auto_17957 - FLEVEL
      ?auto_17955 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17956 ?auto_17958 ) ( NEXT ?auto_17957 ?auto_17955 ) ( not ( = ?auto_17953 ?auto_17958 ) ) ( not ( = ?auto_17955 ?auto_17957 ) ) ( PERSON-AT ?auto_17954 ?auto_17958 ) ( FUEL-LEVEL ?auto_17956 ?auto_17957 ) )
    :subtasks
    ( ( !REFUEL ?auto_17956 ?auto_17958 ?auto_17957 ?auto_17955 )
      ( FLY-1PPL ?auto_17954 ?auto_17953 )
      ( FLY-1PPL-VERIFY ?auto_17954 ?auto_17953 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_17975 - PERSON
      ?auto_17974 - CITY
    )
    :vars
    (
      ?auto_17977 - FLEVEL
      ?auto_17979 - FLEVEL
      ?auto_17976 - CITY
      ?auto_17978 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17977 ?auto_17979 ) ( not ( = ?auto_17974 ?auto_17976 ) ) ( not ( = ?auto_17979 ?auto_17977 ) ) ( PERSON-AT ?auto_17975 ?auto_17976 ) ( AIRCRAFT-AT ?auto_17978 ?auto_17974 ) ( FUEL-LEVEL ?auto_17978 ?auto_17979 ) )
    :subtasks
    ( ( !FLY ?auto_17978 ?auto_17974 ?auto_17976 ?auto_17979 ?auto_17977 )
      ( FLY-1PPL ?auto_17975 ?auto_17974 )
      ( FLY-1PPL-VERIFY ?auto_17975 ?auto_17974 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_17996 - PERSON
      ?auto_17995 - CITY
    )
    :vars
    (
      ?auto_17999 - FLEVEL
      ?auto_18000 - FLEVEL
      ?auto_17998 - CITY
      ?auto_17997 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17999 ?auto_18000 ) ( not ( = ?auto_17995 ?auto_17998 ) ) ( not ( = ?auto_18000 ?auto_17999 ) ) ( PERSON-AT ?auto_17996 ?auto_17998 ) ( AIRCRAFT-AT ?auto_17997 ?auto_17995 ) ( FUEL-LEVEL ?auto_17997 ?auto_17999 ) )
    :subtasks
    ( ( !REFUEL ?auto_17997 ?auto_17995 ?auto_17999 ?auto_18000 )
      ( FLY-1PPL ?auto_17996 ?auto_17995 )
      ( FLY-1PPL-VERIFY ?auto_17996 ?auto_17995 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18056 - PERSON
      ?auto_18055 - CITY
    )
    :vars
    (
      ?auto_18057 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_18056 ?auto_18057 ) ( AIRCRAFT-AT ?auto_18057 ?auto_18055 ) )
    :subtasks
    ( ( !DEBARK ?auto_18056 ?auto_18057 ?auto_18055 )
      ( FLY-1PPL-VERIFY ?auto_18056 ?auto_18055 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18059 - PERSON
      ?auto_18060 - PERSON
      ?auto_18058 - CITY
    )
    :vars
    (
      ?auto_18061 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_18060 ?auto_18061 ) ( AIRCRAFT-AT ?auto_18061 ?auto_18058 ) ( PERSON-AT ?auto_18059 ?auto_18058 ) ( not ( = ?auto_18059 ?auto_18060 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18060 ?auto_18058 )
      ( FLY-2PPL-VERIFY ?auto_18059 ?auto_18060 ?auto_18058 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18063 - PERSON
      ?auto_18064 - PERSON
      ?auto_18062 - CITY
    )
    :vars
    (
      ?auto_18065 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_18063 ?auto_18065 ) ( AIRCRAFT-AT ?auto_18065 ?auto_18062 ) ( PERSON-AT ?auto_18064 ?auto_18062 ) ( not ( = ?auto_18063 ?auto_18064 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18063 ?auto_18062 )
      ( FLY-2PPL-VERIFY ?auto_18063 ?auto_18064 ?auto_18062 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18071 - PERSON
      ?auto_18072 - PERSON
      ?auto_18073 - PERSON
      ?auto_18070 - CITY
    )
    :vars
    (
      ?auto_18074 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_18073 ?auto_18074 ) ( AIRCRAFT-AT ?auto_18074 ?auto_18070 ) ( PERSON-AT ?auto_18071 ?auto_18070 ) ( PERSON-AT ?auto_18072 ?auto_18070 ) ( not ( = ?auto_18071 ?auto_18072 ) ) ( not ( = ?auto_18071 ?auto_18073 ) ) ( not ( = ?auto_18072 ?auto_18073 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18073 ?auto_18070 )
      ( FLY-3PPL-VERIFY ?auto_18071 ?auto_18072 ?auto_18073 ?auto_18070 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18076 - PERSON
      ?auto_18077 - PERSON
      ?auto_18078 - PERSON
      ?auto_18075 - CITY
    )
    :vars
    (
      ?auto_18079 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_18077 ?auto_18079 ) ( AIRCRAFT-AT ?auto_18079 ?auto_18075 ) ( PERSON-AT ?auto_18076 ?auto_18075 ) ( PERSON-AT ?auto_18078 ?auto_18075 ) ( not ( = ?auto_18076 ?auto_18077 ) ) ( not ( = ?auto_18076 ?auto_18078 ) ) ( not ( = ?auto_18077 ?auto_18078 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18077 ?auto_18075 )
      ( FLY-3PPL-VERIFY ?auto_18076 ?auto_18077 ?auto_18078 ?auto_18075 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18086 - PERSON
      ?auto_18087 - PERSON
      ?auto_18088 - PERSON
      ?auto_18085 - CITY
    )
    :vars
    (
      ?auto_18089 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_18086 ?auto_18089 ) ( AIRCRAFT-AT ?auto_18089 ?auto_18085 ) ( PERSON-AT ?auto_18087 ?auto_18085 ) ( PERSON-AT ?auto_18088 ?auto_18085 ) ( not ( = ?auto_18086 ?auto_18087 ) ) ( not ( = ?auto_18086 ?auto_18088 ) ) ( not ( = ?auto_18087 ?auto_18088 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18086 ?auto_18085 )
      ( FLY-3PPL-VERIFY ?auto_18086 ?auto_18087 ?auto_18088 ?auto_18085 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18106 - PERSON
      ?auto_18105 - CITY
    )
    :vars
    (
      ?auto_18107 - AIRCRAFT
      ?auto_18110 - CITY
      ?auto_18108 - FLEVEL
      ?auto_18109 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_18106 ?auto_18107 ) ( AIRCRAFT-AT ?auto_18107 ?auto_18110 ) ( FUEL-LEVEL ?auto_18107 ?auto_18108 ) ( NEXT ?auto_18109 ?auto_18108 ) ( not ( = ?auto_18105 ?auto_18110 ) ) ( not ( = ?auto_18108 ?auto_18109 ) ) )
    :subtasks
    ( ( !FLY ?auto_18107 ?auto_18110 ?auto_18105 ?auto_18108 ?auto_18109 )
      ( FLY-1PPL ?auto_18106 ?auto_18105 )
      ( FLY-1PPL-VERIFY ?auto_18106 ?auto_18105 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18112 - PERSON
      ?auto_18113 - PERSON
      ?auto_18111 - CITY
    )
    :vars
    (
      ?auto_18117 - AIRCRAFT
      ?auto_18115 - CITY
      ?auto_18116 - FLEVEL
      ?auto_18114 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_18113 ?auto_18117 ) ( AIRCRAFT-AT ?auto_18117 ?auto_18115 ) ( FUEL-LEVEL ?auto_18117 ?auto_18116 ) ( NEXT ?auto_18114 ?auto_18116 ) ( not ( = ?auto_18111 ?auto_18115 ) ) ( not ( = ?auto_18116 ?auto_18114 ) ) ( PERSON-AT ?auto_18112 ?auto_18111 ) ( not ( = ?auto_18112 ?auto_18113 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18113 ?auto_18111 )
      ( FLY-2PPL-VERIFY ?auto_18112 ?auto_18113 ?auto_18111 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18119 - PERSON
      ?auto_18120 - PERSON
      ?auto_18118 - CITY
    )
    :vars
    (
      ?auto_18123 - AIRCRAFT
      ?auto_18124 - CITY
      ?auto_18121 - FLEVEL
      ?auto_18122 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_18119 ?auto_18123 ) ( AIRCRAFT-AT ?auto_18123 ?auto_18124 ) ( FUEL-LEVEL ?auto_18123 ?auto_18121 ) ( NEXT ?auto_18122 ?auto_18121 ) ( not ( = ?auto_18118 ?auto_18124 ) ) ( not ( = ?auto_18121 ?auto_18122 ) ) ( PERSON-AT ?auto_18120 ?auto_18118 ) ( not ( = ?auto_18120 ?auto_18119 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18120 ?auto_18119 ?auto_18118 )
      ( FLY-2PPL-VERIFY ?auto_18119 ?auto_18120 ?auto_18118 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18134 - PERSON
      ?auto_18135 - PERSON
      ?auto_18136 - PERSON
      ?auto_18133 - CITY
    )
    :vars
    (
      ?auto_18139 - AIRCRAFT
      ?auto_18140 - CITY
      ?auto_18137 - FLEVEL
      ?auto_18138 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_18136 ?auto_18139 ) ( AIRCRAFT-AT ?auto_18139 ?auto_18140 ) ( FUEL-LEVEL ?auto_18139 ?auto_18137 ) ( NEXT ?auto_18138 ?auto_18137 ) ( not ( = ?auto_18133 ?auto_18140 ) ) ( not ( = ?auto_18137 ?auto_18138 ) ) ( PERSON-AT ?auto_18135 ?auto_18133 ) ( not ( = ?auto_18135 ?auto_18136 ) ) ( PERSON-AT ?auto_18134 ?auto_18133 ) ( not ( = ?auto_18134 ?auto_18135 ) ) ( not ( = ?auto_18134 ?auto_18136 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18135 ?auto_18136 ?auto_18133 )
      ( FLY-3PPL-VERIFY ?auto_18134 ?auto_18135 ?auto_18136 ?auto_18133 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18142 - PERSON
      ?auto_18143 - PERSON
      ?auto_18144 - PERSON
      ?auto_18141 - CITY
    )
    :vars
    (
      ?auto_18147 - AIRCRAFT
      ?auto_18148 - CITY
      ?auto_18145 - FLEVEL
      ?auto_18146 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_18143 ?auto_18147 ) ( AIRCRAFT-AT ?auto_18147 ?auto_18148 ) ( FUEL-LEVEL ?auto_18147 ?auto_18145 ) ( NEXT ?auto_18146 ?auto_18145 ) ( not ( = ?auto_18141 ?auto_18148 ) ) ( not ( = ?auto_18145 ?auto_18146 ) ) ( PERSON-AT ?auto_18144 ?auto_18141 ) ( not ( = ?auto_18144 ?auto_18143 ) ) ( PERSON-AT ?auto_18142 ?auto_18141 ) ( not ( = ?auto_18142 ?auto_18143 ) ) ( not ( = ?auto_18142 ?auto_18144 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18144 ?auto_18143 ?auto_18141 )
      ( FLY-3PPL-VERIFY ?auto_18142 ?auto_18143 ?auto_18144 ?auto_18141 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18158 - PERSON
      ?auto_18159 - PERSON
      ?auto_18160 - PERSON
      ?auto_18157 - CITY
    )
    :vars
    (
      ?auto_18163 - AIRCRAFT
      ?auto_18164 - CITY
      ?auto_18161 - FLEVEL
      ?auto_18162 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_18158 ?auto_18163 ) ( AIRCRAFT-AT ?auto_18163 ?auto_18164 ) ( FUEL-LEVEL ?auto_18163 ?auto_18161 ) ( NEXT ?auto_18162 ?auto_18161 ) ( not ( = ?auto_18157 ?auto_18164 ) ) ( not ( = ?auto_18161 ?auto_18162 ) ) ( PERSON-AT ?auto_18159 ?auto_18157 ) ( not ( = ?auto_18159 ?auto_18158 ) ) ( PERSON-AT ?auto_18160 ?auto_18157 ) ( not ( = ?auto_18158 ?auto_18160 ) ) ( not ( = ?auto_18159 ?auto_18160 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18159 ?auto_18158 ?auto_18157 )
      ( FLY-3PPL-VERIFY ?auto_18158 ?auto_18159 ?auto_18160 ?auto_18157 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18191 - PERSON
      ?auto_18190 - CITY
    )
    :vars
    (
      ?auto_18195 - AIRCRAFT
      ?auto_18196 - CITY
      ?auto_18192 - FLEVEL
      ?auto_18193 - FLEVEL
      ?auto_18194 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_18195 ?auto_18196 ) ( FUEL-LEVEL ?auto_18195 ?auto_18192 ) ( NEXT ?auto_18193 ?auto_18192 ) ( not ( = ?auto_18190 ?auto_18196 ) ) ( not ( = ?auto_18192 ?auto_18193 ) ) ( PERSON-AT ?auto_18194 ?auto_18190 ) ( not ( = ?auto_18194 ?auto_18191 ) ) ( PERSON-AT ?auto_18191 ?auto_18196 ) )
    :subtasks
    ( ( !BOARD ?auto_18191 ?auto_18195 ?auto_18196 )
      ( FLY-2PPL ?auto_18194 ?auto_18191 ?auto_18190 )
      ( FLY-1PPL-VERIFY ?auto_18191 ?auto_18190 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18198 - PERSON
      ?auto_18199 - PERSON
      ?auto_18197 - CITY
    )
    :vars
    (
      ?auto_18203 - AIRCRAFT
      ?auto_18200 - CITY
      ?auto_18202 - FLEVEL
      ?auto_18201 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_18203 ?auto_18200 ) ( FUEL-LEVEL ?auto_18203 ?auto_18202 ) ( NEXT ?auto_18201 ?auto_18202 ) ( not ( = ?auto_18197 ?auto_18200 ) ) ( not ( = ?auto_18202 ?auto_18201 ) ) ( PERSON-AT ?auto_18198 ?auto_18197 ) ( not ( = ?auto_18198 ?auto_18199 ) ) ( PERSON-AT ?auto_18199 ?auto_18200 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18199 ?auto_18197 )
      ( FLY-2PPL-VERIFY ?auto_18198 ?auto_18199 ?auto_18197 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18205 - PERSON
      ?auto_18206 - PERSON
      ?auto_18204 - CITY
    )
    :vars
    (
      ?auto_18207 - AIRCRAFT
      ?auto_18210 - CITY
      ?auto_18209 - FLEVEL
      ?auto_18208 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_18207 ?auto_18210 ) ( FUEL-LEVEL ?auto_18207 ?auto_18209 ) ( NEXT ?auto_18208 ?auto_18209 ) ( not ( = ?auto_18204 ?auto_18210 ) ) ( not ( = ?auto_18209 ?auto_18208 ) ) ( PERSON-AT ?auto_18206 ?auto_18204 ) ( not ( = ?auto_18206 ?auto_18205 ) ) ( PERSON-AT ?auto_18205 ?auto_18210 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18206 ?auto_18205 ?auto_18204 )
      ( FLY-2PPL-VERIFY ?auto_18205 ?auto_18206 ?auto_18204 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18220 - PERSON
      ?auto_18221 - PERSON
      ?auto_18222 - PERSON
      ?auto_18219 - CITY
    )
    :vars
    (
      ?auto_18223 - AIRCRAFT
      ?auto_18226 - CITY
      ?auto_18225 - FLEVEL
      ?auto_18224 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_18223 ?auto_18226 ) ( FUEL-LEVEL ?auto_18223 ?auto_18225 ) ( NEXT ?auto_18224 ?auto_18225 ) ( not ( = ?auto_18219 ?auto_18226 ) ) ( not ( = ?auto_18225 ?auto_18224 ) ) ( PERSON-AT ?auto_18221 ?auto_18219 ) ( not ( = ?auto_18221 ?auto_18222 ) ) ( PERSON-AT ?auto_18222 ?auto_18226 ) ( PERSON-AT ?auto_18220 ?auto_18219 ) ( not ( = ?auto_18220 ?auto_18221 ) ) ( not ( = ?auto_18220 ?auto_18222 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18221 ?auto_18222 ?auto_18219 )
      ( FLY-3PPL-VERIFY ?auto_18220 ?auto_18221 ?auto_18222 ?auto_18219 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18228 - PERSON
      ?auto_18229 - PERSON
      ?auto_18230 - PERSON
      ?auto_18227 - CITY
    )
    :vars
    (
      ?auto_18231 - AIRCRAFT
      ?auto_18234 - CITY
      ?auto_18233 - FLEVEL
      ?auto_18232 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_18231 ?auto_18234 ) ( FUEL-LEVEL ?auto_18231 ?auto_18233 ) ( NEXT ?auto_18232 ?auto_18233 ) ( not ( = ?auto_18227 ?auto_18234 ) ) ( not ( = ?auto_18233 ?auto_18232 ) ) ( PERSON-AT ?auto_18230 ?auto_18227 ) ( not ( = ?auto_18230 ?auto_18229 ) ) ( PERSON-AT ?auto_18229 ?auto_18234 ) ( PERSON-AT ?auto_18228 ?auto_18227 ) ( not ( = ?auto_18228 ?auto_18229 ) ) ( not ( = ?auto_18228 ?auto_18230 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18230 ?auto_18229 ?auto_18227 )
      ( FLY-3PPL-VERIFY ?auto_18228 ?auto_18229 ?auto_18230 ?auto_18227 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18244 - PERSON
      ?auto_18245 - PERSON
      ?auto_18246 - PERSON
      ?auto_18243 - CITY
    )
    :vars
    (
      ?auto_18247 - AIRCRAFT
      ?auto_18250 - CITY
      ?auto_18249 - FLEVEL
      ?auto_18248 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_18247 ?auto_18250 ) ( FUEL-LEVEL ?auto_18247 ?auto_18249 ) ( NEXT ?auto_18248 ?auto_18249 ) ( not ( = ?auto_18243 ?auto_18250 ) ) ( not ( = ?auto_18249 ?auto_18248 ) ) ( PERSON-AT ?auto_18246 ?auto_18243 ) ( not ( = ?auto_18246 ?auto_18244 ) ) ( PERSON-AT ?auto_18244 ?auto_18250 ) ( PERSON-AT ?auto_18245 ?auto_18243 ) ( not ( = ?auto_18244 ?auto_18245 ) ) ( not ( = ?auto_18245 ?auto_18246 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18246 ?auto_18244 ?auto_18243 )
      ( FLY-3PPL-VERIFY ?auto_18244 ?auto_18245 ?auto_18246 ?auto_18243 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18277 - PERSON
      ?auto_18276 - CITY
    )
    :vars
    (
      ?auto_18279 - AIRCRAFT
      ?auto_18282 - CITY
      ?auto_18280 - FLEVEL
      ?auto_18281 - FLEVEL
      ?auto_18278 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_18279 ?auto_18282 ) ( NEXT ?auto_18280 ?auto_18281 ) ( not ( = ?auto_18276 ?auto_18282 ) ) ( not ( = ?auto_18281 ?auto_18280 ) ) ( PERSON-AT ?auto_18278 ?auto_18276 ) ( not ( = ?auto_18278 ?auto_18277 ) ) ( PERSON-AT ?auto_18277 ?auto_18282 ) ( FUEL-LEVEL ?auto_18279 ?auto_18280 ) )
    :subtasks
    ( ( !REFUEL ?auto_18279 ?auto_18282 ?auto_18280 ?auto_18281 )
      ( FLY-2PPL ?auto_18278 ?auto_18277 ?auto_18276 )
      ( FLY-1PPL-VERIFY ?auto_18277 ?auto_18276 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18284 - PERSON
      ?auto_18285 - PERSON
      ?auto_18283 - CITY
    )
    :vars
    (
      ?auto_18287 - AIRCRAFT
      ?auto_18288 - CITY
      ?auto_18289 - FLEVEL
      ?auto_18286 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_18287 ?auto_18288 ) ( NEXT ?auto_18289 ?auto_18286 ) ( not ( = ?auto_18283 ?auto_18288 ) ) ( not ( = ?auto_18286 ?auto_18289 ) ) ( PERSON-AT ?auto_18284 ?auto_18283 ) ( not ( = ?auto_18284 ?auto_18285 ) ) ( PERSON-AT ?auto_18285 ?auto_18288 ) ( FUEL-LEVEL ?auto_18287 ?auto_18289 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18285 ?auto_18283 )
      ( FLY-2PPL-VERIFY ?auto_18284 ?auto_18285 ?auto_18283 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18291 - PERSON
      ?auto_18292 - PERSON
      ?auto_18290 - CITY
    )
    :vars
    (
      ?auto_18293 - AIRCRAFT
      ?auto_18295 - CITY
      ?auto_18296 - FLEVEL
      ?auto_18294 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_18293 ?auto_18295 ) ( NEXT ?auto_18296 ?auto_18294 ) ( not ( = ?auto_18290 ?auto_18295 ) ) ( not ( = ?auto_18294 ?auto_18296 ) ) ( PERSON-AT ?auto_18292 ?auto_18290 ) ( not ( = ?auto_18292 ?auto_18291 ) ) ( PERSON-AT ?auto_18291 ?auto_18295 ) ( FUEL-LEVEL ?auto_18293 ?auto_18296 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18292 ?auto_18291 ?auto_18290 )
      ( FLY-2PPL-VERIFY ?auto_18291 ?auto_18292 ?auto_18290 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18306 - PERSON
      ?auto_18307 - PERSON
      ?auto_18308 - PERSON
      ?auto_18305 - CITY
    )
    :vars
    (
      ?auto_18309 - AIRCRAFT
      ?auto_18311 - CITY
      ?auto_18312 - FLEVEL
      ?auto_18310 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_18309 ?auto_18311 ) ( NEXT ?auto_18312 ?auto_18310 ) ( not ( = ?auto_18305 ?auto_18311 ) ) ( not ( = ?auto_18310 ?auto_18312 ) ) ( PERSON-AT ?auto_18306 ?auto_18305 ) ( not ( = ?auto_18306 ?auto_18308 ) ) ( PERSON-AT ?auto_18308 ?auto_18311 ) ( FUEL-LEVEL ?auto_18309 ?auto_18312 ) ( PERSON-AT ?auto_18307 ?auto_18305 ) ( not ( = ?auto_18306 ?auto_18307 ) ) ( not ( = ?auto_18307 ?auto_18308 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18306 ?auto_18308 ?auto_18305 )
      ( FLY-3PPL-VERIFY ?auto_18306 ?auto_18307 ?auto_18308 ?auto_18305 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18314 - PERSON
      ?auto_18315 - PERSON
      ?auto_18316 - PERSON
      ?auto_18313 - CITY
    )
    :vars
    (
      ?auto_18317 - AIRCRAFT
      ?auto_18319 - CITY
      ?auto_18320 - FLEVEL
      ?auto_18318 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_18317 ?auto_18319 ) ( NEXT ?auto_18320 ?auto_18318 ) ( not ( = ?auto_18313 ?auto_18319 ) ) ( not ( = ?auto_18318 ?auto_18320 ) ) ( PERSON-AT ?auto_18314 ?auto_18313 ) ( not ( = ?auto_18314 ?auto_18315 ) ) ( PERSON-AT ?auto_18315 ?auto_18319 ) ( FUEL-LEVEL ?auto_18317 ?auto_18320 ) ( PERSON-AT ?auto_18316 ?auto_18313 ) ( not ( = ?auto_18314 ?auto_18316 ) ) ( not ( = ?auto_18315 ?auto_18316 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18314 ?auto_18315 ?auto_18313 )
      ( FLY-3PPL-VERIFY ?auto_18314 ?auto_18315 ?auto_18316 ?auto_18313 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18330 - PERSON
      ?auto_18331 - PERSON
      ?auto_18332 - PERSON
      ?auto_18329 - CITY
    )
    :vars
    (
      ?auto_18333 - AIRCRAFT
      ?auto_18335 - CITY
      ?auto_18336 - FLEVEL
      ?auto_18334 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_18333 ?auto_18335 ) ( NEXT ?auto_18336 ?auto_18334 ) ( not ( = ?auto_18329 ?auto_18335 ) ) ( not ( = ?auto_18334 ?auto_18336 ) ) ( PERSON-AT ?auto_18332 ?auto_18329 ) ( not ( = ?auto_18332 ?auto_18330 ) ) ( PERSON-AT ?auto_18330 ?auto_18335 ) ( FUEL-LEVEL ?auto_18333 ?auto_18336 ) ( PERSON-AT ?auto_18331 ?auto_18329 ) ( not ( = ?auto_18330 ?auto_18331 ) ) ( not ( = ?auto_18331 ?auto_18332 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18332 ?auto_18330 ?auto_18329 )
      ( FLY-3PPL-VERIFY ?auto_18330 ?auto_18331 ?auto_18332 ?auto_18329 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18363 - PERSON
      ?auto_18362 - CITY
    )
    :vars
    (
      ?auto_18368 - FLEVEL
      ?auto_18366 - FLEVEL
      ?auto_18367 - CITY
      ?auto_18364 - PERSON
      ?auto_18365 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18368 ?auto_18366 ) ( not ( = ?auto_18362 ?auto_18367 ) ) ( not ( = ?auto_18366 ?auto_18368 ) ) ( PERSON-AT ?auto_18364 ?auto_18362 ) ( not ( = ?auto_18364 ?auto_18363 ) ) ( PERSON-AT ?auto_18363 ?auto_18367 ) ( AIRCRAFT-AT ?auto_18365 ?auto_18362 ) ( FUEL-LEVEL ?auto_18365 ?auto_18366 ) )
    :subtasks
    ( ( !FLY ?auto_18365 ?auto_18362 ?auto_18367 ?auto_18366 ?auto_18368 )
      ( FLY-2PPL ?auto_18364 ?auto_18363 ?auto_18362 )
      ( FLY-1PPL-VERIFY ?auto_18363 ?auto_18362 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18370 - PERSON
      ?auto_18371 - PERSON
      ?auto_18369 - CITY
    )
    :vars
    (
      ?auto_18372 - FLEVEL
      ?auto_18375 - FLEVEL
      ?auto_18374 - CITY
      ?auto_18373 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18372 ?auto_18375 ) ( not ( = ?auto_18369 ?auto_18374 ) ) ( not ( = ?auto_18375 ?auto_18372 ) ) ( PERSON-AT ?auto_18370 ?auto_18369 ) ( not ( = ?auto_18370 ?auto_18371 ) ) ( PERSON-AT ?auto_18371 ?auto_18374 ) ( AIRCRAFT-AT ?auto_18373 ?auto_18369 ) ( FUEL-LEVEL ?auto_18373 ?auto_18375 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18371 ?auto_18369 )
      ( FLY-2PPL-VERIFY ?auto_18370 ?auto_18371 ?auto_18369 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18377 - PERSON
      ?auto_18378 - PERSON
      ?auto_18376 - CITY
    )
    :vars
    (
      ?auto_18380 - FLEVEL
      ?auto_18382 - FLEVEL
      ?auto_18379 - CITY
      ?auto_18381 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18380 ?auto_18382 ) ( not ( = ?auto_18376 ?auto_18379 ) ) ( not ( = ?auto_18382 ?auto_18380 ) ) ( PERSON-AT ?auto_18378 ?auto_18376 ) ( not ( = ?auto_18378 ?auto_18377 ) ) ( PERSON-AT ?auto_18377 ?auto_18379 ) ( AIRCRAFT-AT ?auto_18381 ?auto_18376 ) ( FUEL-LEVEL ?auto_18381 ?auto_18382 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18378 ?auto_18377 ?auto_18376 )
      ( FLY-2PPL-VERIFY ?auto_18377 ?auto_18378 ?auto_18376 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18392 - PERSON
      ?auto_18393 - PERSON
      ?auto_18394 - PERSON
      ?auto_18391 - CITY
    )
    :vars
    (
      ?auto_18396 - FLEVEL
      ?auto_18398 - FLEVEL
      ?auto_18395 - CITY
      ?auto_18397 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18396 ?auto_18398 ) ( not ( = ?auto_18391 ?auto_18395 ) ) ( not ( = ?auto_18398 ?auto_18396 ) ) ( PERSON-AT ?auto_18393 ?auto_18391 ) ( not ( = ?auto_18393 ?auto_18394 ) ) ( PERSON-AT ?auto_18394 ?auto_18395 ) ( AIRCRAFT-AT ?auto_18397 ?auto_18391 ) ( FUEL-LEVEL ?auto_18397 ?auto_18398 ) ( PERSON-AT ?auto_18392 ?auto_18391 ) ( not ( = ?auto_18392 ?auto_18393 ) ) ( not ( = ?auto_18392 ?auto_18394 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18393 ?auto_18394 ?auto_18391 )
      ( FLY-3PPL-VERIFY ?auto_18392 ?auto_18393 ?auto_18394 ?auto_18391 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18400 - PERSON
      ?auto_18401 - PERSON
      ?auto_18402 - PERSON
      ?auto_18399 - CITY
    )
    :vars
    (
      ?auto_18404 - FLEVEL
      ?auto_18406 - FLEVEL
      ?auto_18403 - CITY
      ?auto_18405 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18404 ?auto_18406 ) ( not ( = ?auto_18399 ?auto_18403 ) ) ( not ( = ?auto_18406 ?auto_18404 ) ) ( PERSON-AT ?auto_18402 ?auto_18399 ) ( not ( = ?auto_18402 ?auto_18401 ) ) ( PERSON-AT ?auto_18401 ?auto_18403 ) ( AIRCRAFT-AT ?auto_18405 ?auto_18399 ) ( FUEL-LEVEL ?auto_18405 ?auto_18406 ) ( PERSON-AT ?auto_18400 ?auto_18399 ) ( not ( = ?auto_18400 ?auto_18401 ) ) ( not ( = ?auto_18400 ?auto_18402 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18402 ?auto_18401 ?auto_18399 )
      ( FLY-3PPL-VERIFY ?auto_18400 ?auto_18401 ?auto_18402 ?auto_18399 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18416 - PERSON
      ?auto_18417 - PERSON
      ?auto_18418 - PERSON
      ?auto_18415 - CITY
    )
    :vars
    (
      ?auto_18420 - FLEVEL
      ?auto_18422 - FLEVEL
      ?auto_18419 - CITY
      ?auto_18421 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18420 ?auto_18422 ) ( not ( = ?auto_18415 ?auto_18419 ) ) ( not ( = ?auto_18422 ?auto_18420 ) ) ( PERSON-AT ?auto_18418 ?auto_18415 ) ( not ( = ?auto_18418 ?auto_18416 ) ) ( PERSON-AT ?auto_18416 ?auto_18419 ) ( AIRCRAFT-AT ?auto_18421 ?auto_18415 ) ( FUEL-LEVEL ?auto_18421 ?auto_18422 ) ( PERSON-AT ?auto_18417 ?auto_18415 ) ( not ( = ?auto_18416 ?auto_18417 ) ) ( not ( = ?auto_18417 ?auto_18418 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18418 ?auto_18416 ?auto_18415 )
      ( FLY-3PPL-VERIFY ?auto_18416 ?auto_18417 ?auto_18418 ?auto_18415 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18449 - PERSON
      ?auto_18448 - CITY
    )
    :vars
    (
      ?auto_18451 - FLEVEL
      ?auto_18453 - FLEVEL
      ?auto_18450 - CITY
      ?auto_18454 - PERSON
      ?auto_18452 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18451 ?auto_18453 ) ( not ( = ?auto_18448 ?auto_18450 ) ) ( not ( = ?auto_18453 ?auto_18451 ) ) ( PERSON-AT ?auto_18454 ?auto_18448 ) ( not ( = ?auto_18454 ?auto_18449 ) ) ( PERSON-AT ?auto_18449 ?auto_18450 ) ( AIRCRAFT-AT ?auto_18452 ?auto_18448 ) ( FUEL-LEVEL ?auto_18452 ?auto_18451 ) )
    :subtasks
    ( ( !REFUEL ?auto_18452 ?auto_18448 ?auto_18451 ?auto_18453 )
      ( FLY-2PPL ?auto_18454 ?auto_18449 ?auto_18448 )
      ( FLY-1PPL-VERIFY ?auto_18449 ?auto_18448 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18456 - PERSON
      ?auto_18457 - PERSON
      ?auto_18455 - CITY
    )
    :vars
    (
      ?auto_18458 - FLEVEL
      ?auto_18461 - FLEVEL
      ?auto_18460 - CITY
      ?auto_18459 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18458 ?auto_18461 ) ( not ( = ?auto_18455 ?auto_18460 ) ) ( not ( = ?auto_18461 ?auto_18458 ) ) ( PERSON-AT ?auto_18456 ?auto_18455 ) ( not ( = ?auto_18456 ?auto_18457 ) ) ( PERSON-AT ?auto_18457 ?auto_18460 ) ( AIRCRAFT-AT ?auto_18459 ?auto_18455 ) ( FUEL-LEVEL ?auto_18459 ?auto_18458 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18457 ?auto_18455 )
      ( FLY-2PPL-VERIFY ?auto_18456 ?auto_18457 ?auto_18455 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18463 - PERSON
      ?auto_18464 - PERSON
      ?auto_18462 - CITY
    )
    :vars
    (
      ?auto_18465 - FLEVEL
      ?auto_18467 - FLEVEL
      ?auto_18466 - CITY
      ?auto_18468 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18465 ?auto_18467 ) ( not ( = ?auto_18462 ?auto_18466 ) ) ( not ( = ?auto_18467 ?auto_18465 ) ) ( PERSON-AT ?auto_18464 ?auto_18462 ) ( not ( = ?auto_18464 ?auto_18463 ) ) ( PERSON-AT ?auto_18463 ?auto_18466 ) ( AIRCRAFT-AT ?auto_18468 ?auto_18462 ) ( FUEL-LEVEL ?auto_18468 ?auto_18465 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18464 ?auto_18463 ?auto_18462 )
      ( FLY-2PPL-VERIFY ?auto_18463 ?auto_18464 ?auto_18462 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18478 - PERSON
      ?auto_18479 - PERSON
      ?auto_18480 - PERSON
      ?auto_18477 - CITY
    )
    :vars
    (
      ?auto_18481 - FLEVEL
      ?auto_18483 - FLEVEL
      ?auto_18482 - CITY
      ?auto_18484 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18481 ?auto_18483 ) ( not ( = ?auto_18477 ?auto_18482 ) ) ( not ( = ?auto_18483 ?auto_18481 ) ) ( PERSON-AT ?auto_18478 ?auto_18477 ) ( not ( = ?auto_18478 ?auto_18480 ) ) ( PERSON-AT ?auto_18480 ?auto_18482 ) ( AIRCRAFT-AT ?auto_18484 ?auto_18477 ) ( FUEL-LEVEL ?auto_18484 ?auto_18481 ) ( PERSON-AT ?auto_18479 ?auto_18477 ) ( not ( = ?auto_18478 ?auto_18479 ) ) ( not ( = ?auto_18479 ?auto_18480 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18478 ?auto_18480 ?auto_18477 )
      ( FLY-3PPL-VERIFY ?auto_18478 ?auto_18479 ?auto_18480 ?auto_18477 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18486 - PERSON
      ?auto_18487 - PERSON
      ?auto_18488 - PERSON
      ?auto_18485 - CITY
    )
    :vars
    (
      ?auto_18489 - FLEVEL
      ?auto_18491 - FLEVEL
      ?auto_18490 - CITY
      ?auto_18492 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18489 ?auto_18491 ) ( not ( = ?auto_18485 ?auto_18490 ) ) ( not ( = ?auto_18491 ?auto_18489 ) ) ( PERSON-AT ?auto_18488 ?auto_18485 ) ( not ( = ?auto_18488 ?auto_18487 ) ) ( PERSON-AT ?auto_18487 ?auto_18490 ) ( AIRCRAFT-AT ?auto_18492 ?auto_18485 ) ( FUEL-LEVEL ?auto_18492 ?auto_18489 ) ( PERSON-AT ?auto_18486 ?auto_18485 ) ( not ( = ?auto_18486 ?auto_18487 ) ) ( not ( = ?auto_18486 ?auto_18488 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18488 ?auto_18487 ?auto_18485 )
      ( FLY-3PPL-VERIFY ?auto_18486 ?auto_18487 ?auto_18488 ?auto_18485 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_18502 - PERSON
      ?auto_18503 - PERSON
      ?auto_18504 - PERSON
      ?auto_18501 - CITY
    )
    :vars
    (
      ?auto_18505 - FLEVEL
      ?auto_18507 - FLEVEL
      ?auto_18506 - CITY
      ?auto_18508 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18505 ?auto_18507 ) ( not ( = ?auto_18501 ?auto_18506 ) ) ( not ( = ?auto_18507 ?auto_18505 ) ) ( PERSON-AT ?auto_18504 ?auto_18501 ) ( not ( = ?auto_18504 ?auto_18502 ) ) ( PERSON-AT ?auto_18502 ?auto_18506 ) ( AIRCRAFT-AT ?auto_18508 ?auto_18501 ) ( FUEL-LEVEL ?auto_18508 ?auto_18505 ) ( PERSON-AT ?auto_18503 ?auto_18501 ) ( not ( = ?auto_18502 ?auto_18503 ) ) ( not ( = ?auto_18503 ?auto_18504 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18504 ?auto_18502 ?auto_18501 )
      ( FLY-3PPL-VERIFY ?auto_18502 ?auto_18503 ?auto_18504 ?auto_18501 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18535 - PERSON
      ?auto_18534 - CITY
    )
    :vars
    (
      ?auto_18537 - FLEVEL
      ?auto_18539 - FLEVEL
      ?auto_18538 - CITY
      ?auto_18536 - PERSON
      ?auto_18540 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18537 ?auto_18539 ) ( not ( = ?auto_18534 ?auto_18538 ) ) ( not ( = ?auto_18539 ?auto_18537 ) ) ( not ( = ?auto_18536 ?auto_18535 ) ) ( PERSON-AT ?auto_18535 ?auto_18538 ) ( AIRCRAFT-AT ?auto_18540 ?auto_18534 ) ( FUEL-LEVEL ?auto_18540 ?auto_18537 ) ( IN ?auto_18536 ?auto_18540 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18536 ?auto_18534 )
      ( FLY-2PPL ?auto_18536 ?auto_18535 ?auto_18534 )
      ( FLY-1PPL-VERIFY ?auto_18535 ?auto_18534 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18542 - PERSON
      ?auto_18543 - PERSON
      ?auto_18541 - CITY
    )
    :vars
    (
      ?auto_18544 - FLEVEL
      ?auto_18546 - FLEVEL
      ?auto_18547 - CITY
      ?auto_18545 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18544 ?auto_18546 ) ( not ( = ?auto_18541 ?auto_18547 ) ) ( not ( = ?auto_18546 ?auto_18544 ) ) ( not ( = ?auto_18542 ?auto_18543 ) ) ( PERSON-AT ?auto_18543 ?auto_18547 ) ( AIRCRAFT-AT ?auto_18545 ?auto_18541 ) ( FUEL-LEVEL ?auto_18545 ?auto_18544 ) ( IN ?auto_18542 ?auto_18545 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18543 ?auto_18541 )
      ( FLY-2PPL-VERIFY ?auto_18542 ?auto_18543 ?auto_18541 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18549 - PERSON
      ?auto_18550 - PERSON
      ?auto_18548 - CITY
    )
    :vars
    (
      ?auto_18553 - FLEVEL
      ?auto_18551 - FLEVEL
      ?auto_18554 - CITY
      ?auto_18552 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18553 ?auto_18551 ) ( not ( = ?auto_18548 ?auto_18554 ) ) ( not ( = ?auto_18551 ?auto_18553 ) ) ( not ( = ?auto_18550 ?auto_18549 ) ) ( PERSON-AT ?auto_18549 ?auto_18554 ) ( AIRCRAFT-AT ?auto_18552 ?auto_18548 ) ( FUEL-LEVEL ?auto_18552 ?auto_18553 ) ( IN ?auto_18550 ?auto_18552 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18550 ?auto_18549 ?auto_18548 )
      ( FLY-2PPL-VERIFY ?auto_18549 ?auto_18550 ?auto_18548 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18621 - PERSON
      ?auto_18620 - CITY
    )
    :vars
    (
      ?auto_18625 - FLEVEL
      ?auto_18622 - FLEVEL
      ?auto_18626 - CITY
      ?auto_18624 - PERSON
      ?auto_18623 - AIRCRAFT
      ?auto_18627 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18625 ?auto_18622 ) ( not ( = ?auto_18620 ?auto_18626 ) ) ( not ( = ?auto_18622 ?auto_18625 ) ) ( not ( = ?auto_18624 ?auto_18621 ) ) ( PERSON-AT ?auto_18621 ?auto_18626 ) ( IN ?auto_18624 ?auto_18623 ) ( AIRCRAFT-AT ?auto_18623 ?auto_18627 ) ( FUEL-LEVEL ?auto_18623 ?auto_18622 ) ( not ( = ?auto_18620 ?auto_18627 ) ) ( not ( = ?auto_18626 ?auto_18627 ) ) )
    :subtasks
    ( ( !FLY ?auto_18623 ?auto_18627 ?auto_18620 ?auto_18622 ?auto_18625 )
      ( FLY-2PPL ?auto_18624 ?auto_18621 ?auto_18620 )
      ( FLY-1PPL-VERIFY ?auto_18621 ?auto_18620 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18629 - PERSON
      ?auto_18630 - PERSON
      ?auto_18628 - CITY
    )
    :vars
    (
      ?auto_18633 - FLEVEL
      ?auto_18634 - FLEVEL
      ?auto_18631 - CITY
      ?auto_18632 - AIRCRAFT
      ?auto_18635 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18633 ?auto_18634 ) ( not ( = ?auto_18628 ?auto_18631 ) ) ( not ( = ?auto_18634 ?auto_18633 ) ) ( not ( = ?auto_18629 ?auto_18630 ) ) ( PERSON-AT ?auto_18630 ?auto_18631 ) ( IN ?auto_18629 ?auto_18632 ) ( AIRCRAFT-AT ?auto_18632 ?auto_18635 ) ( FUEL-LEVEL ?auto_18632 ?auto_18634 ) ( not ( = ?auto_18628 ?auto_18635 ) ) ( not ( = ?auto_18631 ?auto_18635 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18630 ?auto_18628 )
      ( FLY-2PPL-VERIFY ?auto_18629 ?auto_18630 ?auto_18628 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18637 - PERSON
      ?auto_18638 - PERSON
      ?auto_18636 - CITY
    )
    :vars
    (
      ?auto_18639 - FLEVEL
      ?auto_18640 - FLEVEL
      ?auto_18641 - CITY
      ?auto_18642 - AIRCRAFT
      ?auto_18643 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18639 ?auto_18640 ) ( not ( = ?auto_18636 ?auto_18641 ) ) ( not ( = ?auto_18640 ?auto_18639 ) ) ( not ( = ?auto_18638 ?auto_18637 ) ) ( PERSON-AT ?auto_18637 ?auto_18641 ) ( IN ?auto_18638 ?auto_18642 ) ( AIRCRAFT-AT ?auto_18642 ?auto_18643 ) ( FUEL-LEVEL ?auto_18642 ?auto_18640 ) ( not ( = ?auto_18636 ?auto_18643 ) ) ( not ( = ?auto_18641 ?auto_18643 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18638 ?auto_18637 ?auto_18636 )
      ( FLY-2PPL-VERIFY ?auto_18637 ?auto_18638 ?auto_18636 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18718 - PERSON
      ?auto_18717 - CITY
    )
    :vars
    (
      ?auto_18719 - FLEVEL
      ?auto_18721 - FLEVEL
      ?auto_18722 - CITY
      ?auto_18720 - PERSON
      ?auto_18723 - AIRCRAFT
      ?auto_18724 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18719 ?auto_18721 ) ( not ( = ?auto_18717 ?auto_18722 ) ) ( not ( = ?auto_18721 ?auto_18719 ) ) ( not ( = ?auto_18720 ?auto_18718 ) ) ( PERSON-AT ?auto_18718 ?auto_18722 ) ( AIRCRAFT-AT ?auto_18723 ?auto_18724 ) ( FUEL-LEVEL ?auto_18723 ?auto_18721 ) ( not ( = ?auto_18717 ?auto_18724 ) ) ( not ( = ?auto_18722 ?auto_18724 ) ) ( PERSON-AT ?auto_18720 ?auto_18724 ) )
    :subtasks
    ( ( !BOARD ?auto_18720 ?auto_18723 ?auto_18724 )
      ( FLY-2PPL ?auto_18720 ?auto_18718 ?auto_18717 )
      ( FLY-1PPL-VERIFY ?auto_18718 ?auto_18717 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18726 - PERSON
      ?auto_18727 - PERSON
      ?auto_18725 - CITY
    )
    :vars
    (
      ?auto_18730 - FLEVEL
      ?auto_18732 - FLEVEL
      ?auto_18728 - CITY
      ?auto_18731 - AIRCRAFT
      ?auto_18729 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18730 ?auto_18732 ) ( not ( = ?auto_18725 ?auto_18728 ) ) ( not ( = ?auto_18732 ?auto_18730 ) ) ( not ( = ?auto_18726 ?auto_18727 ) ) ( PERSON-AT ?auto_18727 ?auto_18728 ) ( AIRCRAFT-AT ?auto_18731 ?auto_18729 ) ( FUEL-LEVEL ?auto_18731 ?auto_18732 ) ( not ( = ?auto_18725 ?auto_18729 ) ) ( not ( = ?auto_18728 ?auto_18729 ) ) ( PERSON-AT ?auto_18726 ?auto_18729 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18727 ?auto_18725 )
      ( FLY-2PPL-VERIFY ?auto_18726 ?auto_18727 ?auto_18725 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18734 - PERSON
      ?auto_18735 - PERSON
      ?auto_18733 - CITY
    )
    :vars
    (
      ?auto_18740 - FLEVEL
      ?auto_18736 - FLEVEL
      ?auto_18739 - CITY
      ?auto_18737 - AIRCRAFT
      ?auto_18738 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18740 ?auto_18736 ) ( not ( = ?auto_18733 ?auto_18739 ) ) ( not ( = ?auto_18736 ?auto_18740 ) ) ( not ( = ?auto_18735 ?auto_18734 ) ) ( PERSON-AT ?auto_18734 ?auto_18739 ) ( AIRCRAFT-AT ?auto_18737 ?auto_18738 ) ( FUEL-LEVEL ?auto_18737 ?auto_18736 ) ( not ( = ?auto_18733 ?auto_18738 ) ) ( not ( = ?auto_18739 ?auto_18738 ) ) ( PERSON-AT ?auto_18735 ?auto_18738 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18735 ?auto_18734 ?auto_18733 )
      ( FLY-2PPL-VERIFY ?auto_18734 ?auto_18735 ?auto_18733 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18815 - PERSON
      ?auto_18814 - CITY
    )
    :vars
    (
      ?auto_18821 - FLEVEL
      ?auto_18817 - FLEVEL
      ?auto_18820 - CITY
      ?auto_18816 - PERSON
      ?auto_18818 - AIRCRAFT
      ?auto_18819 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18821 ?auto_18817 ) ( not ( = ?auto_18814 ?auto_18820 ) ) ( not ( = ?auto_18817 ?auto_18821 ) ) ( not ( = ?auto_18816 ?auto_18815 ) ) ( PERSON-AT ?auto_18815 ?auto_18820 ) ( AIRCRAFT-AT ?auto_18818 ?auto_18819 ) ( not ( = ?auto_18814 ?auto_18819 ) ) ( not ( = ?auto_18820 ?auto_18819 ) ) ( PERSON-AT ?auto_18816 ?auto_18819 ) ( FUEL-LEVEL ?auto_18818 ?auto_18821 ) )
    :subtasks
    ( ( !REFUEL ?auto_18818 ?auto_18819 ?auto_18821 ?auto_18817 )
      ( FLY-2PPL ?auto_18816 ?auto_18815 ?auto_18814 )
      ( FLY-1PPL-VERIFY ?auto_18815 ?auto_18814 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18823 - PERSON
      ?auto_18824 - PERSON
      ?auto_18822 - CITY
    )
    :vars
    (
      ?auto_18828 - FLEVEL
      ?auto_18825 - FLEVEL
      ?auto_18829 - CITY
      ?auto_18827 - AIRCRAFT
      ?auto_18826 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18828 ?auto_18825 ) ( not ( = ?auto_18822 ?auto_18829 ) ) ( not ( = ?auto_18825 ?auto_18828 ) ) ( not ( = ?auto_18823 ?auto_18824 ) ) ( PERSON-AT ?auto_18824 ?auto_18829 ) ( AIRCRAFT-AT ?auto_18827 ?auto_18826 ) ( not ( = ?auto_18822 ?auto_18826 ) ) ( not ( = ?auto_18829 ?auto_18826 ) ) ( PERSON-AT ?auto_18823 ?auto_18826 ) ( FUEL-LEVEL ?auto_18827 ?auto_18828 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18824 ?auto_18822 )
      ( FLY-2PPL-VERIFY ?auto_18823 ?auto_18824 ?auto_18822 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18831 - PERSON
      ?auto_18832 - PERSON
      ?auto_18830 - CITY
    )
    :vars
    (
      ?auto_18837 - FLEVEL
      ?auto_18835 - FLEVEL
      ?auto_18836 - CITY
      ?auto_18834 - AIRCRAFT
      ?auto_18833 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_18837 ?auto_18835 ) ( not ( = ?auto_18830 ?auto_18836 ) ) ( not ( = ?auto_18835 ?auto_18837 ) ) ( not ( = ?auto_18832 ?auto_18831 ) ) ( PERSON-AT ?auto_18831 ?auto_18836 ) ( AIRCRAFT-AT ?auto_18834 ?auto_18833 ) ( not ( = ?auto_18830 ?auto_18833 ) ) ( not ( = ?auto_18836 ?auto_18833 ) ) ( PERSON-AT ?auto_18832 ?auto_18833 ) ( FUEL-LEVEL ?auto_18834 ?auto_18837 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18832 ?auto_18831 ?auto_18830 )
      ( FLY-2PPL-VERIFY ?auto_18831 ?auto_18832 ?auto_18830 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_18912 - PERSON
      ?auto_18911 - CITY
    )
    :vars
    (
      ?auto_18918 - FLEVEL
      ?auto_18916 - FLEVEL
      ?auto_18917 - CITY
      ?auto_18914 - PERSON
      ?auto_18913 - CITY
      ?auto_18915 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18918 ?auto_18916 ) ( not ( = ?auto_18911 ?auto_18917 ) ) ( not ( = ?auto_18916 ?auto_18918 ) ) ( not ( = ?auto_18914 ?auto_18912 ) ) ( PERSON-AT ?auto_18912 ?auto_18917 ) ( not ( = ?auto_18911 ?auto_18913 ) ) ( not ( = ?auto_18917 ?auto_18913 ) ) ( PERSON-AT ?auto_18914 ?auto_18913 ) ( AIRCRAFT-AT ?auto_18915 ?auto_18911 ) ( FUEL-LEVEL ?auto_18915 ?auto_18916 ) )
    :subtasks
    ( ( !FLY ?auto_18915 ?auto_18911 ?auto_18913 ?auto_18916 ?auto_18918 )
      ( FLY-2PPL ?auto_18914 ?auto_18912 ?auto_18911 )
      ( FLY-1PPL-VERIFY ?auto_18912 ?auto_18911 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18920 - PERSON
      ?auto_18921 - PERSON
      ?auto_18919 - CITY
    )
    :vars
    (
      ?auto_18922 - FLEVEL
      ?auto_18924 - FLEVEL
      ?auto_18926 - CITY
      ?auto_18923 - CITY
      ?auto_18925 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18922 ?auto_18924 ) ( not ( = ?auto_18919 ?auto_18926 ) ) ( not ( = ?auto_18924 ?auto_18922 ) ) ( not ( = ?auto_18920 ?auto_18921 ) ) ( PERSON-AT ?auto_18921 ?auto_18926 ) ( not ( = ?auto_18919 ?auto_18923 ) ) ( not ( = ?auto_18926 ?auto_18923 ) ) ( PERSON-AT ?auto_18920 ?auto_18923 ) ( AIRCRAFT-AT ?auto_18925 ?auto_18919 ) ( FUEL-LEVEL ?auto_18925 ?auto_18924 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_18921 ?auto_18919 )
      ( FLY-2PPL-VERIFY ?auto_18920 ?auto_18921 ?auto_18919 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_18928 - PERSON
      ?auto_18929 - PERSON
      ?auto_18927 - CITY
    )
    :vars
    (
      ?auto_18932 - FLEVEL
      ?auto_18930 - FLEVEL
      ?auto_18931 - CITY
      ?auto_18934 - CITY
      ?auto_18933 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_18932 ?auto_18930 ) ( not ( = ?auto_18927 ?auto_18931 ) ) ( not ( = ?auto_18930 ?auto_18932 ) ) ( not ( = ?auto_18929 ?auto_18928 ) ) ( PERSON-AT ?auto_18928 ?auto_18931 ) ( not ( = ?auto_18927 ?auto_18934 ) ) ( not ( = ?auto_18931 ?auto_18934 ) ) ( PERSON-AT ?auto_18929 ?auto_18934 ) ( AIRCRAFT-AT ?auto_18933 ?auto_18927 ) ( FUEL-LEVEL ?auto_18933 ?auto_18930 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_18929 ?auto_18928 ?auto_18927 )
      ( FLY-2PPL-VERIFY ?auto_18928 ?auto_18929 ?auto_18927 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_19009 - PERSON
      ?auto_19008 - CITY
    )
    :vars
    (
      ?auto_19012 - FLEVEL
      ?auto_19010 - FLEVEL
      ?auto_19011 - CITY
      ?auto_19015 - PERSON
      ?auto_19014 - CITY
      ?auto_19013 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19012 ?auto_19010 ) ( not ( = ?auto_19008 ?auto_19011 ) ) ( not ( = ?auto_19010 ?auto_19012 ) ) ( not ( = ?auto_19015 ?auto_19009 ) ) ( PERSON-AT ?auto_19009 ?auto_19011 ) ( not ( = ?auto_19008 ?auto_19014 ) ) ( not ( = ?auto_19011 ?auto_19014 ) ) ( PERSON-AT ?auto_19015 ?auto_19014 ) ( AIRCRAFT-AT ?auto_19013 ?auto_19008 ) ( FUEL-LEVEL ?auto_19013 ?auto_19012 ) )
    :subtasks
    ( ( !REFUEL ?auto_19013 ?auto_19008 ?auto_19012 ?auto_19010 )
      ( FLY-2PPL ?auto_19015 ?auto_19009 ?auto_19008 )
      ( FLY-1PPL-VERIFY ?auto_19009 ?auto_19008 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19017 - PERSON
      ?auto_19018 - PERSON
      ?auto_19016 - CITY
    )
    :vars
    (
      ?auto_19022 - FLEVEL
      ?auto_19023 - FLEVEL
      ?auto_19019 - CITY
      ?auto_19021 - CITY
      ?auto_19020 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19022 ?auto_19023 ) ( not ( = ?auto_19016 ?auto_19019 ) ) ( not ( = ?auto_19023 ?auto_19022 ) ) ( not ( = ?auto_19017 ?auto_19018 ) ) ( PERSON-AT ?auto_19018 ?auto_19019 ) ( not ( = ?auto_19016 ?auto_19021 ) ) ( not ( = ?auto_19019 ?auto_19021 ) ) ( PERSON-AT ?auto_19017 ?auto_19021 ) ( AIRCRAFT-AT ?auto_19020 ?auto_19016 ) ( FUEL-LEVEL ?auto_19020 ?auto_19022 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19018 ?auto_19016 )
      ( FLY-2PPL-VERIFY ?auto_19017 ?auto_19018 ?auto_19016 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19025 - PERSON
      ?auto_19026 - PERSON
      ?auto_19024 - CITY
    )
    :vars
    (
      ?auto_19029 - FLEVEL
      ?auto_19027 - FLEVEL
      ?auto_19031 - CITY
      ?auto_19028 - CITY
      ?auto_19030 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19029 ?auto_19027 ) ( not ( = ?auto_19024 ?auto_19031 ) ) ( not ( = ?auto_19027 ?auto_19029 ) ) ( not ( = ?auto_19026 ?auto_19025 ) ) ( PERSON-AT ?auto_19025 ?auto_19031 ) ( not ( = ?auto_19024 ?auto_19028 ) ) ( not ( = ?auto_19031 ?auto_19028 ) ) ( PERSON-AT ?auto_19026 ?auto_19028 ) ( AIRCRAFT-AT ?auto_19030 ?auto_19024 ) ( FUEL-LEVEL ?auto_19030 ?auto_19029 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19026 ?auto_19025 ?auto_19024 )
      ( FLY-2PPL-VERIFY ?auto_19025 ?auto_19026 ?auto_19024 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_19199 - PERSON
      ?auto_19198 - CITY
    )
    :vars
    (
      ?auto_19200 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19199 ?auto_19200 ) ( AIRCRAFT-AT ?auto_19200 ?auto_19198 ) )
    :subtasks
    ( ( !DEBARK ?auto_19199 ?auto_19200 ?auto_19198 )
      ( FLY-1PPL-VERIFY ?auto_19199 ?auto_19198 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19202 - PERSON
      ?auto_19203 - PERSON
      ?auto_19201 - CITY
    )
    :vars
    (
      ?auto_19204 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19203 ?auto_19204 ) ( AIRCRAFT-AT ?auto_19204 ?auto_19201 ) ( PERSON-AT ?auto_19202 ?auto_19201 ) ( not ( = ?auto_19202 ?auto_19203 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19203 ?auto_19201 )
      ( FLY-2PPL-VERIFY ?auto_19202 ?auto_19203 ?auto_19201 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19206 - PERSON
      ?auto_19207 - PERSON
      ?auto_19205 - CITY
    )
    :vars
    (
      ?auto_19208 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19207 ?auto_19208 ) ( AIRCRAFT-AT ?auto_19208 ?auto_19205 ) ( PERSON-AT ?auto_19206 ?auto_19205 ) ( not ( = ?auto_19206 ?auto_19207 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19207 ?auto_19205 )
      ( FLY-2PPL-VERIFY ?auto_19206 ?auto_19207 ?auto_19205 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19210 - PERSON
      ?auto_19211 - PERSON
      ?auto_19209 - CITY
    )
    :vars
    (
      ?auto_19212 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19210 ?auto_19212 ) ( AIRCRAFT-AT ?auto_19212 ?auto_19209 ) ( PERSON-AT ?auto_19211 ?auto_19209 ) ( not ( = ?auto_19210 ?auto_19211 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19210 ?auto_19209 )
      ( FLY-2PPL-VERIFY ?auto_19210 ?auto_19211 ?auto_19209 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19214 - PERSON
      ?auto_19215 - PERSON
      ?auto_19213 - CITY
    )
    :vars
    (
      ?auto_19216 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19214 ?auto_19216 ) ( AIRCRAFT-AT ?auto_19216 ?auto_19213 ) ( PERSON-AT ?auto_19215 ?auto_19213 ) ( not ( = ?auto_19214 ?auto_19215 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19214 ?auto_19213 )
      ( FLY-2PPL-VERIFY ?auto_19214 ?auto_19215 ?auto_19213 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19222 - PERSON
      ?auto_19223 - PERSON
      ?auto_19224 - PERSON
      ?auto_19221 - CITY
    )
    :vars
    (
      ?auto_19225 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19224 ?auto_19225 ) ( AIRCRAFT-AT ?auto_19225 ?auto_19221 ) ( PERSON-AT ?auto_19222 ?auto_19221 ) ( PERSON-AT ?auto_19223 ?auto_19221 ) ( not ( = ?auto_19222 ?auto_19223 ) ) ( not ( = ?auto_19222 ?auto_19224 ) ) ( not ( = ?auto_19223 ?auto_19224 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19224 ?auto_19221 )
      ( FLY-3PPL-VERIFY ?auto_19222 ?auto_19223 ?auto_19224 ?auto_19221 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19227 - PERSON
      ?auto_19228 - PERSON
      ?auto_19229 - PERSON
      ?auto_19226 - CITY
    )
    :vars
    (
      ?auto_19230 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19229 ?auto_19230 ) ( AIRCRAFT-AT ?auto_19230 ?auto_19226 ) ( PERSON-AT ?auto_19227 ?auto_19226 ) ( PERSON-AT ?auto_19228 ?auto_19226 ) ( not ( = ?auto_19227 ?auto_19228 ) ) ( not ( = ?auto_19227 ?auto_19229 ) ) ( not ( = ?auto_19228 ?auto_19229 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19229 ?auto_19226 )
      ( FLY-3PPL-VERIFY ?auto_19227 ?auto_19228 ?auto_19229 ?auto_19226 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19232 - PERSON
      ?auto_19233 - PERSON
      ?auto_19234 - PERSON
      ?auto_19231 - CITY
    )
    :vars
    (
      ?auto_19235 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19233 ?auto_19235 ) ( AIRCRAFT-AT ?auto_19235 ?auto_19231 ) ( PERSON-AT ?auto_19232 ?auto_19231 ) ( PERSON-AT ?auto_19234 ?auto_19231 ) ( not ( = ?auto_19232 ?auto_19233 ) ) ( not ( = ?auto_19232 ?auto_19234 ) ) ( not ( = ?auto_19233 ?auto_19234 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19233 ?auto_19231 )
      ( FLY-3PPL-VERIFY ?auto_19232 ?auto_19233 ?auto_19234 ?auto_19231 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19237 - PERSON
      ?auto_19238 - PERSON
      ?auto_19239 - PERSON
      ?auto_19236 - CITY
    )
    :vars
    (
      ?auto_19240 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19238 ?auto_19240 ) ( AIRCRAFT-AT ?auto_19240 ?auto_19236 ) ( PERSON-AT ?auto_19237 ?auto_19236 ) ( PERSON-AT ?auto_19239 ?auto_19236 ) ( not ( = ?auto_19237 ?auto_19238 ) ) ( not ( = ?auto_19237 ?auto_19239 ) ) ( not ( = ?auto_19238 ?auto_19239 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19238 ?auto_19236 )
      ( FLY-3PPL-VERIFY ?auto_19237 ?auto_19238 ?auto_19239 ?auto_19236 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19247 - PERSON
      ?auto_19248 - PERSON
      ?auto_19249 - PERSON
      ?auto_19246 - CITY
    )
    :vars
    (
      ?auto_19250 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19249 ?auto_19250 ) ( AIRCRAFT-AT ?auto_19250 ?auto_19246 ) ( PERSON-AT ?auto_19247 ?auto_19246 ) ( PERSON-AT ?auto_19248 ?auto_19246 ) ( not ( = ?auto_19247 ?auto_19248 ) ) ( not ( = ?auto_19247 ?auto_19249 ) ) ( not ( = ?auto_19248 ?auto_19249 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19249 ?auto_19246 )
      ( FLY-3PPL-VERIFY ?auto_19247 ?auto_19248 ?auto_19249 ?auto_19246 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19252 - PERSON
      ?auto_19253 - PERSON
      ?auto_19254 - PERSON
      ?auto_19251 - CITY
    )
    :vars
    (
      ?auto_19255 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19254 ?auto_19255 ) ( AIRCRAFT-AT ?auto_19255 ?auto_19251 ) ( PERSON-AT ?auto_19252 ?auto_19251 ) ( PERSON-AT ?auto_19253 ?auto_19251 ) ( not ( = ?auto_19252 ?auto_19253 ) ) ( not ( = ?auto_19252 ?auto_19254 ) ) ( not ( = ?auto_19253 ?auto_19254 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19254 ?auto_19251 )
      ( FLY-3PPL-VERIFY ?auto_19252 ?auto_19253 ?auto_19254 ?auto_19251 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19257 - PERSON
      ?auto_19258 - PERSON
      ?auto_19259 - PERSON
      ?auto_19256 - CITY
    )
    :vars
    (
      ?auto_19260 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19258 ?auto_19260 ) ( AIRCRAFT-AT ?auto_19260 ?auto_19256 ) ( PERSON-AT ?auto_19257 ?auto_19256 ) ( PERSON-AT ?auto_19259 ?auto_19256 ) ( not ( = ?auto_19257 ?auto_19258 ) ) ( not ( = ?auto_19257 ?auto_19259 ) ) ( not ( = ?auto_19258 ?auto_19259 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19258 ?auto_19256 )
      ( FLY-3PPL-VERIFY ?auto_19257 ?auto_19258 ?auto_19259 ?auto_19256 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19262 - PERSON
      ?auto_19263 - PERSON
      ?auto_19264 - PERSON
      ?auto_19261 - CITY
    )
    :vars
    (
      ?auto_19265 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19263 ?auto_19265 ) ( AIRCRAFT-AT ?auto_19265 ?auto_19261 ) ( PERSON-AT ?auto_19262 ?auto_19261 ) ( PERSON-AT ?auto_19264 ?auto_19261 ) ( not ( = ?auto_19262 ?auto_19263 ) ) ( not ( = ?auto_19262 ?auto_19264 ) ) ( not ( = ?auto_19263 ?auto_19264 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19263 ?auto_19261 )
      ( FLY-3PPL-VERIFY ?auto_19262 ?auto_19263 ?auto_19264 ?auto_19261 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19272 - PERSON
      ?auto_19273 - PERSON
      ?auto_19274 - PERSON
      ?auto_19271 - CITY
    )
    :vars
    (
      ?auto_19275 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19272 ?auto_19275 ) ( AIRCRAFT-AT ?auto_19275 ?auto_19271 ) ( PERSON-AT ?auto_19273 ?auto_19271 ) ( PERSON-AT ?auto_19274 ?auto_19271 ) ( not ( = ?auto_19272 ?auto_19273 ) ) ( not ( = ?auto_19272 ?auto_19274 ) ) ( not ( = ?auto_19273 ?auto_19274 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19272 ?auto_19271 )
      ( FLY-3PPL-VERIFY ?auto_19272 ?auto_19273 ?auto_19274 ?auto_19271 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19277 - PERSON
      ?auto_19278 - PERSON
      ?auto_19279 - PERSON
      ?auto_19276 - CITY
    )
    :vars
    (
      ?auto_19280 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19277 ?auto_19280 ) ( AIRCRAFT-AT ?auto_19280 ?auto_19276 ) ( PERSON-AT ?auto_19278 ?auto_19276 ) ( PERSON-AT ?auto_19279 ?auto_19276 ) ( not ( = ?auto_19277 ?auto_19278 ) ) ( not ( = ?auto_19277 ?auto_19279 ) ) ( not ( = ?auto_19278 ?auto_19279 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19277 ?auto_19276 )
      ( FLY-3PPL-VERIFY ?auto_19277 ?auto_19278 ?auto_19279 ?auto_19276 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19287 - PERSON
      ?auto_19288 - PERSON
      ?auto_19289 - PERSON
      ?auto_19286 - CITY
    )
    :vars
    (
      ?auto_19290 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19287 ?auto_19290 ) ( AIRCRAFT-AT ?auto_19290 ?auto_19286 ) ( PERSON-AT ?auto_19288 ?auto_19286 ) ( PERSON-AT ?auto_19289 ?auto_19286 ) ( not ( = ?auto_19287 ?auto_19288 ) ) ( not ( = ?auto_19287 ?auto_19289 ) ) ( not ( = ?auto_19288 ?auto_19289 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19287 ?auto_19286 )
      ( FLY-3PPL-VERIFY ?auto_19287 ?auto_19288 ?auto_19289 ?auto_19286 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19292 - PERSON
      ?auto_19293 - PERSON
      ?auto_19294 - PERSON
      ?auto_19291 - CITY
    )
    :vars
    (
      ?auto_19295 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_19292 ?auto_19295 ) ( AIRCRAFT-AT ?auto_19295 ?auto_19291 ) ( PERSON-AT ?auto_19293 ?auto_19291 ) ( PERSON-AT ?auto_19294 ?auto_19291 ) ( not ( = ?auto_19292 ?auto_19293 ) ) ( not ( = ?auto_19292 ?auto_19294 ) ) ( not ( = ?auto_19293 ?auto_19294 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19292 ?auto_19291 )
      ( FLY-3PPL-VERIFY ?auto_19292 ?auto_19293 ?auto_19294 ?auto_19291 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_19317 - PERSON
      ?auto_19316 - CITY
    )
    :vars
    (
      ?auto_19318 - AIRCRAFT
      ?auto_19321 - CITY
      ?auto_19319 - FLEVEL
      ?auto_19320 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_19317 ?auto_19318 ) ( AIRCRAFT-AT ?auto_19318 ?auto_19321 ) ( FUEL-LEVEL ?auto_19318 ?auto_19319 ) ( NEXT ?auto_19320 ?auto_19319 ) ( not ( = ?auto_19316 ?auto_19321 ) ) ( not ( = ?auto_19319 ?auto_19320 ) ) )
    :subtasks
    ( ( !FLY ?auto_19318 ?auto_19321 ?auto_19316 ?auto_19319 ?auto_19320 )
      ( FLY-1PPL ?auto_19317 ?auto_19316 )
      ( FLY-1PPL-VERIFY ?auto_19317 ?auto_19316 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19323 - PERSON
      ?auto_19324 - PERSON
      ?auto_19322 - CITY
    )
    :vars
    (
      ?auto_19325 - AIRCRAFT
      ?auto_19326 - CITY
      ?auto_19328 - FLEVEL
      ?auto_19327 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_19324 ?auto_19325 ) ( AIRCRAFT-AT ?auto_19325 ?auto_19326 ) ( FUEL-LEVEL ?auto_19325 ?auto_19328 ) ( NEXT ?auto_19327 ?auto_19328 ) ( not ( = ?auto_19322 ?auto_19326 ) ) ( not ( = ?auto_19328 ?auto_19327 ) ) ( PERSON-AT ?auto_19323 ?auto_19322 ) ( not ( = ?auto_19323 ?auto_19324 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19324 ?auto_19322 )
      ( FLY-2PPL-VERIFY ?auto_19323 ?auto_19324 ?auto_19322 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19330 - PERSON
      ?auto_19331 - PERSON
      ?auto_19329 - CITY
    )
    :vars
    (
      ?auto_19335 - AIRCRAFT
      ?auto_19333 - CITY
      ?auto_19334 - FLEVEL
      ?auto_19336 - FLEVEL
      ?auto_19332 - PERSON
    )
    :precondition
    ( and ( IN ?auto_19331 ?auto_19335 ) ( AIRCRAFT-AT ?auto_19335 ?auto_19333 ) ( FUEL-LEVEL ?auto_19335 ?auto_19334 ) ( NEXT ?auto_19336 ?auto_19334 ) ( not ( = ?auto_19329 ?auto_19333 ) ) ( not ( = ?auto_19334 ?auto_19336 ) ) ( PERSON-AT ?auto_19332 ?auto_19329 ) ( not ( = ?auto_19332 ?auto_19331 ) ) ( PERSON-AT ?auto_19330 ?auto_19329 ) ( not ( = ?auto_19330 ?auto_19331 ) ) ( not ( = ?auto_19330 ?auto_19332 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19332 ?auto_19331 ?auto_19329 )
      ( FLY-2PPL-VERIFY ?auto_19330 ?auto_19331 ?auto_19329 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19338 - PERSON
      ?auto_19339 - PERSON
      ?auto_19337 - CITY
    )
    :vars
    (
      ?auto_19342 - AIRCRAFT
      ?auto_19340 - CITY
      ?auto_19341 - FLEVEL
      ?auto_19343 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_19338 ?auto_19342 ) ( AIRCRAFT-AT ?auto_19342 ?auto_19340 ) ( FUEL-LEVEL ?auto_19342 ?auto_19341 ) ( NEXT ?auto_19343 ?auto_19341 ) ( not ( = ?auto_19337 ?auto_19340 ) ) ( not ( = ?auto_19341 ?auto_19343 ) ) ( PERSON-AT ?auto_19339 ?auto_19337 ) ( not ( = ?auto_19339 ?auto_19338 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19339 ?auto_19338 ?auto_19337 )
      ( FLY-2PPL-VERIFY ?auto_19338 ?auto_19339 ?auto_19337 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19345 - PERSON
      ?auto_19346 - PERSON
      ?auto_19344 - CITY
    )
    :vars
    (
      ?auto_19350 - AIRCRAFT
      ?auto_19348 - CITY
      ?auto_19349 - FLEVEL
      ?auto_19351 - FLEVEL
      ?auto_19347 - PERSON
    )
    :precondition
    ( and ( IN ?auto_19345 ?auto_19350 ) ( AIRCRAFT-AT ?auto_19350 ?auto_19348 ) ( FUEL-LEVEL ?auto_19350 ?auto_19349 ) ( NEXT ?auto_19351 ?auto_19349 ) ( not ( = ?auto_19344 ?auto_19348 ) ) ( not ( = ?auto_19349 ?auto_19351 ) ) ( PERSON-AT ?auto_19347 ?auto_19344 ) ( not ( = ?auto_19347 ?auto_19345 ) ) ( PERSON-AT ?auto_19346 ?auto_19344 ) ( not ( = ?auto_19345 ?auto_19346 ) ) ( not ( = ?auto_19346 ?auto_19347 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19347 ?auto_19345 ?auto_19344 )
      ( FLY-2PPL-VERIFY ?auto_19345 ?auto_19346 ?auto_19344 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19361 - PERSON
      ?auto_19362 - PERSON
      ?auto_19363 - PERSON
      ?auto_19360 - CITY
    )
    :vars
    (
      ?auto_19366 - AIRCRAFT
      ?auto_19364 - CITY
      ?auto_19365 - FLEVEL
      ?auto_19367 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_19363 ?auto_19366 ) ( AIRCRAFT-AT ?auto_19366 ?auto_19364 ) ( FUEL-LEVEL ?auto_19366 ?auto_19365 ) ( NEXT ?auto_19367 ?auto_19365 ) ( not ( = ?auto_19360 ?auto_19364 ) ) ( not ( = ?auto_19365 ?auto_19367 ) ) ( PERSON-AT ?auto_19362 ?auto_19360 ) ( not ( = ?auto_19362 ?auto_19363 ) ) ( PERSON-AT ?auto_19361 ?auto_19360 ) ( not ( = ?auto_19361 ?auto_19362 ) ) ( not ( = ?auto_19361 ?auto_19363 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19362 ?auto_19363 ?auto_19360 )
      ( FLY-3PPL-VERIFY ?auto_19361 ?auto_19362 ?auto_19363 ?auto_19360 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19369 - PERSON
      ?auto_19370 - PERSON
      ?auto_19371 - PERSON
      ?auto_19368 - CITY
    )
    :vars
    (
      ?auto_19374 - AIRCRAFT
      ?auto_19372 - CITY
      ?auto_19373 - FLEVEL
      ?auto_19375 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_19371 ?auto_19374 ) ( AIRCRAFT-AT ?auto_19374 ?auto_19372 ) ( FUEL-LEVEL ?auto_19374 ?auto_19373 ) ( NEXT ?auto_19375 ?auto_19373 ) ( not ( = ?auto_19368 ?auto_19372 ) ) ( not ( = ?auto_19373 ?auto_19375 ) ) ( PERSON-AT ?auto_19369 ?auto_19368 ) ( not ( = ?auto_19369 ?auto_19371 ) ) ( PERSON-AT ?auto_19370 ?auto_19368 ) ( not ( = ?auto_19369 ?auto_19370 ) ) ( not ( = ?auto_19370 ?auto_19371 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19369 ?auto_19371 ?auto_19368 )
      ( FLY-3PPL-VERIFY ?auto_19369 ?auto_19370 ?auto_19371 ?auto_19368 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19377 - PERSON
      ?auto_19378 - PERSON
      ?auto_19379 - PERSON
      ?auto_19376 - CITY
    )
    :vars
    (
      ?auto_19382 - AIRCRAFT
      ?auto_19380 - CITY
      ?auto_19381 - FLEVEL
      ?auto_19383 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_19378 ?auto_19382 ) ( AIRCRAFT-AT ?auto_19382 ?auto_19380 ) ( FUEL-LEVEL ?auto_19382 ?auto_19381 ) ( NEXT ?auto_19383 ?auto_19381 ) ( not ( = ?auto_19376 ?auto_19380 ) ) ( not ( = ?auto_19381 ?auto_19383 ) ) ( PERSON-AT ?auto_19379 ?auto_19376 ) ( not ( = ?auto_19379 ?auto_19378 ) ) ( PERSON-AT ?auto_19377 ?auto_19376 ) ( not ( = ?auto_19377 ?auto_19378 ) ) ( not ( = ?auto_19377 ?auto_19379 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19379 ?auto_19378 ?auto_19376 )
      ( FLY-3PPL-VERIFY ?auto_19377 ?auto_19378 ?auto_19379 ?auto_19376 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19385 - PERSON
      ?auto_19386 - PERSON
      ?auto_19387 - PERSON
      ?auto_19384 - CITY
    )
    :vars
    (
      ?auto_19390 - AIRCRAFT
      ?auto_19388 - CITY
      ?auto_19389 - FLEVEL
      ?auto_19391 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_19386 ?auto_19390 ) ( AIRCRAFT-AT ?auto_19390 ?auto_19388 ) ( FUEL-LEVEL ?auto_19390 ?auto_19389 ) ( NEXT ?auto_19391 ?auto_19389 ) ( not ( = ?auto_19384 ?auto_19388 ) ) ( not ( = ?auto_19389 ?auto_19391 ) ) ( PERSON-AT ?auto_19385 ?auto_19384 ) ( not ( = ?auto_19385 ?auto_19386 ) ) ( PERSON-AT ?auto_19387 ?auto_19384 ) ( not ( = ?auto_19385 ?auto_19387 ) ) ( not ( = ?auto_19386 ?auto_19387 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19385 ?auto_19386 ?auto_19384 )
      ( FLY-3PPL-VERIFY ?auto_19385 ?auto_19386 ?auto_19387 ?auto_19384 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19401 - PERSON
      ?auto_19402 - PERSON
      ?auto_19403 - PERSON
      ?auto_19400 - CITY
    )
    :vars
    (
      ?auto_19406 - AIRCRAFT
      ?auto_19404 - CITY
      ?auto_19405 - FLEVEL
      ?auto_19407 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_19403 ?auto_19406 ) ( AIRCRAFT-AT ?auto_19406 ?auto_19404 ) ( FUEL-LEVEL ?auto_19406 ?auto_19405 ) ( NEXT ?auto_19407 ?auto_19405 ) ( not ( = ?auto_19400 ?auto_19404 ) ) ( not ( = ?auto_19405 ?auto_19407 ) ) ( PERSON-AT ?auto_19402 ?auto_19400 ) ( not ( = ?auto_19402 ?auto_19403 ) ) ( PERSON-AT ?auto_19401 ?auto_19400 ) ( not ( = ?auto_19401 ?auto_19402 ) ) ( not ( = ?auto_19401 ?auto_19403 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19402 ?auto_19403 ?auto_19400 )
      ( FLY-3PPL-VERIFY ?auto_19401 ?auto_19402 ?auto_19403 ?auto_19400 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19409 - PERSON
      ?auto_19410 - PERSON
      ?auto_19411 - PERSON
      ?auto_19408 - CITY
    )
    :vars
    (
      ?auto_19415 - AIRCRAFT
      ?auto_19413 - CITY
      ?auto_19414 - FLEVEL
      ?auto_19416 - FLEVEL
      ?auto_19412 - PERSON
    )
    :precondition
    ( and ( IN ?auto_19411 ?auto_19415 ) ( AIRCRAFT-AT ?auto_19415 ?auto_19413 ) ( FUEL-LEVEL ?auto_19415 ?auto_19414 ) ( NEXT ?auto_19416 ?auto_19414 ) ( not ( = ?auto_19408 ?auto_19413 ) ) ( not ( = ?auto_19414 ?auto_19416 ) ) ( PERSON-AT ?auto_19412 ?auto_19408 ) ( not ( = ?auto_19412 ?auto_19411 ) ) ( PERSON-AT ?auto_19409 ?auto_19408 ) ( PERSON-AT ?auto_19410 ?auto_19408 ) ( not ( = ?auto_19409 ?auto_19410 ) ) ( not ( = ?auto_19409 ?auto_19411 ) ) ( not ( = ?auto_19409 ?auto_19412 ) ) ( not ( = ?auto_19410 ?auto_19411 ) ) ( not ( = ?auto_19410 ?auto_19412 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19412 ?auto_19411 ?auto_19408 )
      ( FLY-3PPL-VERIFY ?auto_19409 ?auto_19410 ?auto_19411 ?auto_19408 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19418 - PERSON
      ?auto_19419 - PERSON
      ?auto_19420 - PERSON
      ?auto_19417 - CITY
    )
    :vars
    (
      ?auto_19423 - AIRCRAFT
      ?auto_19421 - CITY
      ?auto_19422 - FLEVEL
      ?auto_19424 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_19419 ?auto_19423 ) ( AIRCRAFT-AT ?auto_19423 ?auto_19421 ) ( FUEL-LEVEL ?auto_19423 ?auto_19422 ) ( NEXT ?auto_19424 ?auto_19422 ) ( not ( = ?auto_19417 ?auto_19421 ) ) ( not ( = ?auto_19422 ?auto_19424 ) ) ( PERSON-AT ?auto_19420 ?auto_19417 ) ( not ( = ?auto_19420 ?auto_19419 ) ) ( PERSON-AT ?auto_19418 ?auto_19417 ) ( not ( = ?auto_19418 ?auto_19419 ) ) ( not ( = ?auto_19418 ?auto_19420 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19420 ?auto_19419 ?auto_19417 )
      ( FLY-3PPL-VERIFY ?auto_19418 ?auto_19419 ?auto_19420 ?auto_19417 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19426 - PERSON
      ?auto_19427 - PERSON
      ?auto_19428 - PERSON
      ?auto_19425 - CITY
    )
    :vars
    (
      ?auto_19432 - AIRCRAFT
      ?auto_19430 - CITY
      ?auto_19431 - FLEVEL
      ?auto_19433 - FLEVEL
      ?auto_19429 - PERSON
    )
    :precondition
    ( and ( IN ?auto_19427 ?auto_19432 ) ( AIRCRAFT-AT ?auto_19432 ?auto_19430 ) ( FUEL-LEVEL ?auto_19432 ?auto_19431 ) ( NEXT ?auto_19433 ?auto_19431 ) ( not ( = ?auto_19425 ?auto_19430 ) ) ( not ( = ?auto_19431 ?auto_19433 ) ) ( PERSON-AT ?auto_19429 ?auto_19425 ) ( not ( = ?auto_19429 ?auto_19427 ) ) ( PERSON-AT ?auto_19426 ?auto_19425 ) ( PERSON-AT ?auto_19428 ?auto_19425 ) ( not ( = ?auto_19426 ?auto_19427 ) ) ( not ( = ?auto_19426 ?auto_19428 ) ) ( not ( = ?auto_19426 ?auto_19429 ) ) ( not ( = ?auto_19427 ?auto_19428 ) ) ( not ( = ?auto_19428 ?auto_19429 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19429 ?auto_19427 ?auto_19425 )
      ( FLY-3PPL-VERIFY ?auto_19426 ?auto_19427 ?auto_19428 ?auto_19425 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19444 - PERSON
      ?auto_19445 - PERSON
      ?auto_19446 - PERSON
      ?auto_19443 - CITY
    )
    :vars
    (
      ?auto_19449 - AIRCRAFT
      ?auto_19447 - CITY
      ?auto_19448 - FLEVEL
      ?auto_19450 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_19444 ?auto_19449 ) ( AIRCRAFT-AT ?auto_19449 ?auto_19447 ) ( FUEL-LEVEL ?auto_19449 ?auto_19448 ) ( NEXT ?auto_19450 ?auto_19448 ) ( not ( = ?auto_19443 ?auto_19447 ) ) ( not ( = ?auto_19448 ?auto_19450 ) ) ( PERSON-AT ?auto_19446 ?auto_19443 ) ( not ( = ?auto_19446 ?auto_19444 ) ) ( PERSON-AT ?auto_19445 ?auto_19443 ) ( not ( = ?auto_19444 ?auto_19445 ) ) ( not ( = ?auto_19445 ?auto_19446 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19446 ?auto_19444 ?auto_19443 )
      ( FLY-3PPL-VERIFY ?auto_19444 ?auto_19445 ?auto_19446 ?auto_19443 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19452 - PERSON
      ?auto_19453 - PERSON
      ?auto_19454 - PERSON
      ?auto_19451 - CITY
    )
    :vars
    (
      ?auto_19457 - AIRCRAFT
      ?auto_19455 - CITY
      ?auto_19456 - FLEVEL
      ?auto_19458 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_19452 ?auto_19457 ) ( AIRCRAFT-AT ?auto_19457 ?auto_19455 ) ( FUEL-LEVEL ?auto_19457 ?auto_19456 ) ( NEXT ?auto_19458 ?auto_19456 ) ( not ( = ?auto_19451 ?auto_19455 ) ) ( not ( = ?auto_19456 ?auto_19458 ) ) ( PERSON-AT ?auto_19453 ?auto_19451 ) ( not ( = ?auto_19453 ?auto_19452 ) ) ( PERSON-AT ?auto_19454 ?auto_19451 ) ( not ( = ?auto_19452 ?auto_19454 ) ) ( not ( = ?auto_19453 ?auto_19454 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19453 ?auto_19452 ?auto_19451 )
      ( FLY-3PPL-VERIFY ?auto_19452 ?auto_19453 ?auto_19454 ?auto_19451 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19468 - PERSON
      ?auto_19469 - PERSON
      ?auto_19470 - PERSON
      ?auto_19467 - CITY
    )
    :vars
    (
      ?auto_19473 - AIRCRAFT
      ?auto_19471 - CITY
      ?auto_19472 - FLEVEL
      ?auto_19474 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_19468 ?auto_19473 ) ( AIRCRAFT-AT ?auto_19473 ?auto_19471 ) ( FUEL-LEVEL ?auto_19473 ?auto_19472 ) ( NEXT ?auto_19474 ?auto_19472 ) ( not ( = ?auto_19467 ?auto_19471 ) ) ( not ( = ?auto_19472 ?auto_19474 ) ) ( PERSON-AT ?auto_19470 ?auto_19467 ) ( not ( = ?auto_19470 ?auto_19468 ) ) ( PERSON-AT ?auto_19469 ?auto_19467 ) ( not ( = ?auto_19468 ?auto_19469 ) ) ( not ( = ?auto_19469 ?auto_19470 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19470 ?auto_19468 ?auto_19467 )
      ( FLY-3PPL-VERIFY ?auto_19468 ?auto_19469 ?auto_19470 ?auto_19467 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19476 - PERSON
      ?auto_19477 - PERSON
      ?auto_19478 - PERSON
      ?auto_19475 - CITY
    )
    :vars
    (
      ?auto_19482 - AIRCRAFT
      ?auto_19480 - CITY
      ?auto_19481 - FLEVEL
      ?auto_19483 - FLEVEL
      ?auto_19479 - PERSON
    )
    :precondition
    ( and ( IN ?auto_19476 ?auto_19482 ) ( AIRCRAFT-AT ?auto_19482 ?auto_19480 ) ( FUEL-LEVEL ?auto_19482 ?auto_19481 ) ( NEXT ?auto_19483 ?auto_19481 ) ( not ( = ?auto_19475 ?auto_19480 ) ) ( not ( = ?auto_19481 ?auto_19483 ) ) ( PERSON-AT ?auto_19479 ?auto_19475 ) ( not ( = ?auto_19479 ?auto_19476 ) ) ( PERSON-AT ?auto_19477 ?auto_19475 ) ( PERSON-AT ?auto_19478 ?auto_19475 ) ( not ( = ?auto_19476 ?auto_19477 ) ) ( not ( = ?auto_19476 ?auto_19478 ) ) ( not ( = ?auto_19477 ?auto_19478 ) ) ( not ( = ?auto_19477 ?auto_19479 ) ) ( not ( = ?auto_19478 ?auto_19479 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19479 ?auto_19476 ?auto_19475 )
      ( FLY-3PPL-VERIFY ?auto_19476 ?auto_19477 ?auto_19478 ?auto_19475 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_19520 - PERSON
      ?auto_19519 - CITY
    )
    :vars
    (
      ?auto_19524 - AIRCRAFT
      ?auto_19522 - CITY
      ?auto_19523 - FLEVEL
      ?auto_19525 - FLEVEL
      ?auto_19521 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19524 ?auto_19522 ) ( FUEL-LEVEL ?auto_19524 ?auto_19523 ) ( NEXT ?auto_19525 ?auto_19523 ) ( not ( = ?auto_19519 ?auto_19522 ) ) ( not ( = ?auto_19523 ?auto_19525 ) ) ( PERSON-AT ?auto_19521 ?auto_19519 ) ( not ( = ?auto_19521 ?auto_19520 ) ) ( PERSON-AT ?auto_19520 ?auto_19522 ) )
    :subtasks
    ( ( !BOARD ?auto_19520 ?auto_19524 ?auto_19522 )
      ( FLY-2PPL ?auto_19521 ?auto_19520 ?auto_19519 )
      ( FLY-1PPL-VERIFY ?auto_19520 ?auto_19519 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19527 - PERSON
      ?auto_19528 - PERSON
      ?auto_19526 - CITY
    )
    :vars
    (
      ?auto_19532 - AIRCRAFT
      ?auto_19530 - CITY
      ?auto_19529 - FLEVEL
      ?auto_19531 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19532 ?auto_19530 ) ( FUEL-LEVEL ?auto_19532 ?auto_19529 ) ( NEXT ?auto_19531 ?auto_19529 ) ( not ( = ?auto_19526 ?auto_19530 ) ) ( not ( = ?auto_19529 ?auto_19531 ) ) ( PERSON-AT ?auto_19527 ?auto_19526 ) ( not ( = ?auto_19527 ?auto_19528 ) ) ( PERSON-AT ?auto_19528 ?auto_19530 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19528 ?auto_19526 )
      ( FLY-2PPL-VERIFY ?auto_19527 ?auto_19528 ?auto_19526 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19534 - PERSON
      ?auto_19535 - PERSON
      ?auto_19533 - CITY
    )
    :vars
    (
      ?auto_19538 - AIRCRAFT
      ?auto_19540 - CITY
      ?auto_19536 - FLEVEL
      ?auto_19537 - FLEVEL
      ?auto_19539 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19538 ?auto_19540 ) ( FUEL-LEVEL ?auto_19538 ?auto_19536 ) ( NEXT ?auto_19537 ?auto_19536 ) ( not ( = ?auto_19533 ?auto_19540 ) ) ( not ( = ?auto_19536 ?auto_19537 ) ) ( PERSON-AT ?auto_19539 ?auto_19533 ) ( not ( = ?auto_19539 ?auto_19535 ) ) ( PERSON-AT ?auto_19535 ?auto_19540 ) ( PERSON-AT ?auto_19534 ?auto_19533 ) ( not ( = ?auto_19534 ?auto_19535 ) ) ( not ( = ?auto_19534 ?auto_19539 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19539 ?auto_19535 ?auto_19533 )
      ( FLY-2PPL-VERIFY ?auto_19534 ?auto_19535 ?auto_19533 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19542 - PERSON
      ?auto_19543 - PERSON
      ?auto_19541 - CITY
    )
    :vars
    (
      ?auto_19546 - AIRCRAFT
      ?auto_19547 - CITY
      ?auto_19544 - FLEVEL
      ?auto_19545 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19546 ?auto_19547 ) ( FUEL-LEVEL ?auto_19546 ?auto_19544 ) ( NEXT ?auto_19545 ?auto_19544 ) ( not ( = ?auto_19541 ?auto_19547 ) ) ( not ( = ?auto_19544 ?auto_19545 ) ) ( PERSON-AT ?auto_19543 ?auto_19541 ) ( not ( = ?auto_19543 ?auto_19542 ) ) ( PERSON-AT ?auto_19542 ?auto_19547 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19543 ?auto_19542 ?auto_19541 )
      ( FLY-2PPL-VERIFY ?auto_19542 ?auto_19543 ?auto_19541 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19549 - PERSON
      ?auto_19550 - PERSON
      ?auto_19548 - CITY
    )
    :vars
    (
      ?auto_19553 - AIRCRAFT
      ?auto_19555 - CITY
      ?auto_19551 - FLEVEL
      ?auto_19552 - FLEVEL
      ?auto_19554 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19553 ?auto_19555 ) ( FUEL-LEVEL ?auto_19553 ?auto_19551 ) ( NEXT ?auto_19552 ?auto_19551 ) ( not ( = ?auto_19548 ?auto_19555 ) ) ( not ( = ?auto_19551 ?auto_19552 ) ) ( PERSON-AT ?auto_19554 ?auto_19548 ) ( not ( = ?auto_19554 ?auto_19549 ) ) ( PERSON-AT ?auto_19549 ?auto_19555 ) ( PERSON-AT ?auto_19550 ?auto_19548 ) ( not ( = ?auto_19549 ?auto_19550 ) ) ( not ( = ?auto_19550 ?auto_19554 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19554 ?auto_19549 ?auto_19548 )
      ( FLY-2PPL-VERIFY ?auto_19549 ?auto_19550 ?auto_19548 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19565 - PERSON
      ?auto_19566 - PERSON
      ?auto_19567 - PERSON
      ?auto_19564 - CITY
    )
    :vars
    (
      ?auto_19570 - AIRCRAFT
      ?auto_19571 - CITY
      ?auto_19568 - FLEVEL
      ?auto_19569 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19570 ?auto_19571 ) ( FUEL-LEVEL ?auto_19570 ?auto_19568 ) ( NEXT ?auto_19569 ?auto_19568 ) ( not ( = ?auto_19564 ?auto_19571 ) ) ( not ( = ?auto_19568 ?auto_19569 ) ) ( PERSON-AT ?auto_19566 ?auto_19564 ) ( not ( = ?auto_19566 ?auto_19567 ) ) ( PERSON-AT ?auto_19567 ?auto_19571 ) ( PERSON-AT ?auto_19565 ?auto_19564 ) ( not ( = ?auto_19565 ?auto_19566 ) ) ( not ( = ?auto_19565 ?auto_19567 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19566 ?auto_19567 ?auto_19564 )
      ( FLY-3PPL-VERIFY ?auto_19565 ?auto_19566 ?auto_19567 ?auto_19564 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19573 - PERSON
      ?auto_19574 - PERSON
      ?auto_19575 - PERSON
      ?auto_19572 - CITY
    )
    :vars
    (
      ?auto_19578 - AIRCRAFT
      ?auto_19579 - CITY
      ?auto_19576 - FLEVEL
      ?auto_19577 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19578 ?auto_19579 ) ( FUEL-LEVEL ?auto_19578 ?auto_19576 ) ( NEXT ?auto_19577 ?auto_19576 ) ( not ( = ?auto_19572 ?auto_19579 ) ) ( not ( = ?auto_19576 ?auto_19577 ) ) ( PERSON-AT ?auto_19573 ?auto_19572 ) ( not ( = ?auto_19573 ?auto_19575 ) ) ( PERSON-AT ?auto_19575 ?auto_19579 ) ( PERSON-AT ?auto_19574 ?auto_19572 ) ( not ( = ?auto_19573 ?auto_19574 ) ) ( not ( = ?auto_19574 ?auto_19575 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19573 ?auto_19575 ?auto_19572 )
      ( FLY-3PPL-VERIFY ?auto_19573 ?auto_19574 ?auto_19575 ?auto_19572 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19581 - PERSON
      ?auto_19582 - PERSON
      ?auto_19583 - PERSON
      ?auto_19580 - CITY
    )
    :vars
    (
      ?auto_19586 - AIRCRAFT
      ?auto_19587 - CITY
      ?auto_19584 - FLEVEL
      ?auto_19585 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19586 ?auto_19587 ) ( FUEL-LEVEL ?auto_19586 ?auto_19584 ) ( NEXT ?auto_19585 ?auto_19584 ) ( not ( = ?auto_19580 ?auto_19587 ) ) ( not ( = ?auto_19584 ?auto_19585 ) ) ( PERSON-AT ?auto_19583 ?auto_19580 ) ( not ( = ?auto_19583 ?auto_19582 ) ) ( PERSON-AT ?auto_19582 ?auto_19587 ) ( PERSON-AT ?auto_19581 ?auto_19580 ) ( not ( = ?auto_19581 ?auto_19582 ) ) ( not ( = ?auto_19581 ?auto_19583 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19583 ?auto_19582 ?auto_19580 )
      ( FLY-3PPL-VERIFY ?auto_19581 ?auto_19582 ?auto_19583 ?auto_19580 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19589 - PERSON
      ?auto_19590 - PERSON
      ?auto_19591 - PERSON
      ?auto_19588 - CITY
    )
    :vars
    (
      ?auto_19594 - AIRCRAFT
      ?auto_19595 - CITY
      ?auto_19592 - FLEVEL
      ?auto_19593 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19594 ?auto_19595 ) ( FUEL-LEVEL ?auto_19594 ?auto_19592 ) ( NEXT ?auto_19593 ?auto_19592 ) ( not ( = ?auto_19588 ?auto_19595 ) ) ( not ( = ?auto_19592 ?auto_19593 ) ) ( PERSON-AT ?auto_19589 ?auto_19588 ) ( not ( = ?auto_19589 ?auto_19590 ) ) ( PERSON-AT ?auto_19590 ?auto_19595 ) ( PERSON-AT ?auto_19591 ?auto_19588 ) ( not ( = ?auto_19589 ?auto_19591 ) ) ( not ( = ?auto_19590 ?auto_19591 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19589 ?auto_19590 ?auto_19588 )
      ( FLY-3PPL-VERIFY ?auto_19589 ?auto_19590 ?auto_19591 ?auto_19588 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19605 - PERSON
      ?auto_19606 - PERSON
      ?auto_19607 - PERSON
      ?auto_19604 - CITY
    )
    :vars
    (
      ?auto_19610 - AIRCRAFT
      ?auto_19611 - CITY
      ?auto_19608 - FLEVEL
      ?auto_19609 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19610 ?auto_19611 ) ( FUEL-LEVEL ?auto_19610 ?auto_19608 ) ( NEXT ?auto_19609 ?auto_19608 ) ( not ( = ?auto_19604 ?auto_19611 ) ) ( not ( = ?auto_19608 ?auto_19609 ) ) ( PERSON-AT ?auto_19606 ?auto_19604 ) ( not ( = ?auto_19606 ?auto_19607 ) ) ( PERSON-AT ?auto_19607 ?auto_19611 ) ( PERSON-AT ?auto_19605 ?auto_19604 ) ( not ( = ?auto_19605 ?auto_19606 ) ) ( not ( = ?auto_19605 ?auto_19607 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19606 ?auto_19607 ?auto_19604 )
      ( FLY-3PPL-VERIFY ?auto_19605 ?auto_19606 ?auto_19607 ?auto_19604 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19613 - PERSON
      ?auto_19614 - PERSON
      ?auto_19615 - PERSON
      ?auto_19612 - CITY
    )
    :vars
    (
      ?auto_19618 - AIRCRAFT
      ?auto_19620 - CITY
      ?auto_19616 - FLEVEL
      ?auto_19617 - FLEVEL
      ?auto_19619 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19618 ?auto_19620 ) ( FUEL-LEVEL ?auto_19618 ?auto_19616 ) ( NEXT ?auto_19617 ?auto_19616 ) ( not ( = ?auto_19612 ?auto_19620 ) ) ( not ( = ?auto_19616 ?auto_19617 ) ) ( PERSON-AT ?auto_19619 ?auto_19612 ) ( not ( = ?auto_19619 ?auto_19615 ) ) ( PERSON-AT ?auto_19615 ?auto_19620 ) ( PERSON-AT ?auto_19613 ?auto_19612 ) ( PERSON-AT ?auto_19614 ?auto_19612 ) ( not ( = ?auto_19613 ?auto_19614 ) ) ( not ( = ?auto_19613 ?auto_19615 ) ) ( not ( = ?auto_19613 ?auto_19619 ) ) ( not ( = ?auto_19614 ?auto_19615 ) ) ( not ( = ?auto_19614 ?auto_19619 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19619 ?auto_19615 ?auto_19612 )
      ( FLY-3PPL-VERIFY ?auto_19613 ?auto_19614 ?auto_19615 ?auto_19612 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19622 - PERSON
      ?auto_19623 - PERSON
      ?auto_19624 - PERSON
      ?auto_19621 - CITY
    )
    :vars
    (
      ?auto_19627 - AIRCRAFT
      ?auto_19628 - CITY
      ?auto_19625 - FLEVEL
      ?auto_19626 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19627 ?auto_19628 ) ( FUEL-LEVEL ?auto_19627 ?auto_19625 ) ( NEXT ?auto_19626 ?auto_19625 ) ( not ( = ?auto_19621 ?auto_19628 ) ) ( not ( = ?auto_19625 ?auto_19626 ) ) ( PERSON-AT ?auto_19624 ?auto_19621 ) ( not ( = ?auto_19624 ?auto_19623 ) ) ( PERSON-AT ?auto_19623 ?auto_19628 ) ( PERSON-AT ?auto_19622 ?auto_19621 ) ( not ( = ?auto_19622 ?auto_19623 ) ) ( not ( = ?auto_19622 ?auto_19624 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19624 ?auto_19623 ?auto_19621 )
      ( FLY-3PPL-VERIFY ?auto_19622 ?auto_19623 ?auto_19624 ?auto_19621 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19630 - PERSON
      ?auto_19631 - PERSON
      ?auto_19632 - PERSON
      ?auto_19629 - CITY
    )
    :vars
    (
      ?auto_19635 - AIRCRAFT
      ?auto_19637 - CITY
      ?auto_19633 - FLEVEL
      ?auto_19634 - FLEVEL
      ?auto_19636 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19635 ?auto_19637 ) ( FUEL-LEVEL ?auto_19635 ?auto_19633 ) ( NEXT ?auto_19634 ?auto_19633 ) ( not ( = ?auto_19629 ?auto_19637 ) ) ( not ( = ?auto_19633 ?auto_19634 ) ) ( PERSON-AT ?auto_19636 ?auto_19629 ) ( not ( = ?auto_19636 ?auto_19631 ) ) ( PERSON-AT ?auto_19631 ?auto_19637 ) ( PERSON-AT ?auto_19630 ?auto_19629 ) ( PERSON-AT ?auto_19632 ?auto_19629 ) ( not ( = ?auto_19630 ?auto_19631 ) ) ( not ( = ?auto_19630 ?auto_19632 ) ) ( not ( = ?auto_19630 ?auto_19636 ) ) ( not ( = ?auto_19631 ?auto_19632 ) ) ( not ( = ?auto_19632 ?auto_19636 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19636 ?auto_19631 ?auto_19629 )
      ( FLY-3PPL-VERIFY ?auto_19630 ?auto_19631 ?auto_19632 ?auto_19629 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19648 - PERSON
      ?auto_19649 - PERSON
      ?auto_19650 - PERSON
      ?auto_19647 - CITY
    )
    :vars
    (
      ?auto_19653 - AIRCRAFT
      ?auto_19654 - CITY
      ?auto_19651 - FLEVEL
      ?auto_19652 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19653 ?auto_19654 ) ( FUEL-LEVEL ?auto_19653 ?auto_19651 ) ( NEXT ?auto_19652 ?auto_19651 ) ( not ( = ?auto_19647 ?auto_19654 ) ) ( not ( = ?auto_19651 ?auto_19652 ) ) ( PERSON-AT ?auto_19649 ?auto_19647 ) ( not ( = ?auto_19649 ?auto_19648 ) ) ( PERSON-AT ?auto_19648 ?auto_19654 ) ( PERSON-AT ?auto_19650 ?auto_19647 ) ( not ( = ?auto_19648 ?auto_19650 ) ) ( not ( = ?auto_19649 ?auto_19650 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19649 ?auto_19648 ?auto_19647 )
      ( FLY-3PPL-VERIFY ?auto_19648 ?auto_19649 ?auto_19650 ?auto_19647 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19656 - PERSON
      ?auto_19657 - PERSON
      ?auto_19658 - PERSON
      ?auto_19655 - CITY
    )
    :vars
    (
      ?auto_19661 - AIRCRAFT
      ?auto_19662 - CITY
      ?auto_19659 - FLEVEL
      ?auto_19660 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19661 ?auto_19662 ) ( FUEL-LEVEL ?auto_19661 ?auto_19659 ) ( NEXT ?auto_19660 ?auto_19659 ) ( not ( = ?auto_19655 ?auto_19662 ) ) ( not ( = ?auto_19659 ?auto_19660 ) ) ( PERSON-AT ?auto_19657 ?auto_19655 ) ( not ( = ?auto_19657 ?auto_19656 ) ) ( PERSON-AT ?auto_19656 ?auto_19662 ) ( PERSON-AT ?auto_19658 ?auto_19655 ) ( not ( = ?auto_19656 ?auto_19658 ) ) ( not ( = ?auto_19657 ?auto_19658 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19657 ?auto_19656 ?auto_19655 )
      ( FLY-3PPL-VERIFY ?auto_19656 ?auto_19657 ?auto_19658 ?auto_19655 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19672 - PERSON
      ?auto_19673 - PERSON
      ?auto_19674 - PERSON
      ?auto_19671 - CITY
    )
    :vars
    (
      ?auto_19677 - AIRCRAFT
      ?auto_19678 - CITY
      ?auto_19675 - FLEVEL
      ?auto_19676 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19677 ?auto_19678 ) ( FUEL-LEVEL ?auto_19677 ?auto_19675 ) ( NEXT ?auto_19676 ?auto_19675 ) ( not ( = ?auto_19671 ?auto_19678 ) ) ( not ( = ?auto_19675 ?auto_19676 ) ) ( PERSON-AT ?auto_19674 ?auto_19671 ) ( not ( = ?auto_19674 ?auto_19672 ) ) ( PERSON-AT ?auto_19672 ?auto_19678 ) ( PERSON-AT ?auto_19673 ?auto_19671 ) ( not ( = ?auto_19672 ?auto_19673 ) ) ( not ( = ?auto_19673 ?auto_19674 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19674 ?auto_19672 ?auto_19671 )
      ( FLY-3PPL-VERIFY ?auto_19672 ?auto_19673 ?auto_19674 ?auto_19671 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19680 - PERSON
      ?auto_19681 - PERSON
      ?auto_19682 - PERSON
      ?auto_19679 - CITY
    )
    :vars
    (
      ?auto_19685 - AIRCRAFT
      ?auto_19687 - CITY
      ?auto_19683 - FLEVEL
      ?auto_19684 - FLEVEL
      ?auto_19686 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19685 ?auto_19687 ) ( FUEL-LEVEL ?auto_19685 ?auto_19683 ) ( NEXT ?auto_19684 ?auto_19683 ) ( not ( = ?auto_19679 ?auto_19687 ) ) ( not ( = ?auto_19683 ?auto_19684 ) ) ( PERSON-AT ?auto_19686 ?auto_19679 ) ( not ( = ?auto_19686 ?auto_19680 ) ) ( PERSON-AT ?auto_19680 ?auto_19687 ) ( PERSON-AT ?auto_19681 ?auto_19679 ) ( PERSON-AT ?auto_19682 ?auto_19679 ) ( not ( = ?auto_19680 ?auto_19681 ) ) ( not ( = ?auto_19680 ?auto_19682 ) ) ( not ( = ?auto_19681 ?auto_19682 ) ) ( not ( = ?auto_19681 ?auto_19686 ) ) ( not ( = ?auto_19682 ?auto_19686 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19686 ?auto_19680 ?auto_19679 )
      ( FLY-3PPL-VERIFY ?auto_19680 ?auto_19681 ?auto_19682 ?auto_19679 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_19724 - PERSON
      ?auto_19723 - CITY
    )
    :vars
    (
      ?auto_19727 - AIRCRAFT
      ?auto_19729 - CITY
      ?auto_19726 - FLEVEL
      ?auto_19725 - FLEVEL
      ?auto_19728 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19727 ?auto_19729 ) ( NEXT ?auto_19726 ?auto_19725 ) ( not ( = ?auto_19723 ?auto_19729 ) ) ( not ( = ?auto_19725 ?auto_19726 ) ) ( PERSON-AT ?auto_19728 ?auto_19723 ) ( not ( = ?auto_19728 ?auto_19724 ) ) ( PERSON-AT ?auto_19724 ?auto_19729 ) ( FUEL-LEVEL ?auto_19727 ?auto_19726 ) )
    :subtasks
    ( ( !REFUEL ?auto_19727 ?auto_19729 ?auto_19726 ?auto_19725 )
      ( FLY-2PPL ?auto_19728 ?auto_19724 ?auto_19723 )
      ( FLY-1PPL-VERIFY ?auto_19724 ?auto_19723 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19731 - PERSON
      ?auto_19732 - PERSON
      ?auto_19730 - CITY
    )
    :vars
    (
      ?auto_19734 - AIRCRAFT
      ?auto_19735 - CITY
      ?auto_19733 - FLEVEL
      ?auto_19736 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19734 ?auto_19735 ) ( NEXT ?auto_19733 ?auto_19736 ) ( not ( = ?auto_19730 ?auto_19735 ) ) ( not ( = ?auto_19736 ?auto_19733 ) ) ( PERSON-AT ?auto_19731 ?auto_19730 ) ( not ( = ?auto_19731 ?auto_19732 ) ) ( PERSON-AT ?auto_19732 ?auto_19735 ) ( FUEL-LEVEL ?auto_19734 ?auto_19733 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19732 ?auto_19730 )
      ( FLY-2PPL-VERIFY ?auto_19731 ?auto_19732 ?auto_19730 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19738 - PERSON
      ?auto_19739 - PERSON
      ?auto_19737 - CITY
    )
    :vars
    (
      ?auto_19742 - AIRCRAFT
      ?auto_19744 - CITY
      ?auto_19740 - FLEVEL
      ?auto_19743 - FLEVEL
      ?auto_19741 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19742 ?auto_19744 ) ( NEXT ?auto_19740 ?auto_19743 ) ( not ( = ?auto_19737 ?auto_19744 ) ) ( not ( = ?auto_19743 ?auto_19740 ) ) ( PERSON-AT ?auto_19741 ?auto_19737 ) ( not ( = ?auto_19741 ?auto_19739 ) ) ( PERSON-AT ?auto_19739 ?auto_19744 ) ( FUEL-LEVEL ?auto_19742 ?auto_19740 ) ( PERSON-AT ?auto_19738 ?auto_19737 ) ( not ( = ?auto_19738 ?auto_19739 ) ) ( not ( = ?auto_19738 ?auto_19741 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19741 ?auto_19739 ?auto_19737 )
      ( FLY-2PPL-VERIFY ?auto_19738 ?auto_19739 ?auto_19737 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19746 - PERSON
      ?auto_19747 - PERSON
      ?auto_19745 - CITY
    )
    :vars
    (
      ?auto_19749 - AIRCRAFT
      ?auto_19751 - CITY
      ?auto_19748 - FLEVEL
      ?auto_19750 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19749 ?auto_19751 ) ( NEXT ?auto_19748 ?auto_19750 ) ( not ( = ?auto_19745 ?auto_19751 ) ) ( not ( = ?auto_19750 ?auto_19748 ) ) ( PERSON-AT ?auto_19747 ?auto_19745 ) ( not ( = ?auto_19747 ?auto_19746 ) ) ( PERSON-AT ?auto_19746 ?auto_19751 ) ( FUEL-LEVEL ?auto_19749 ?auto_19748 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19747 ?auto_19746 ?auto_19745 )
      ( FLY-2PPL-VERIFY ?auto_19746 ?auto_19747 ?auto_19745 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19753 - PERSON
      ?auto_19754 - PERSON
      ?auto_19752 - CITY
    )
    :vars
    (
      ?auto_19757 - AIRCRAFT
      ?auto_19759 - CITY
      ?auto_19755 - FLEVEL
      ?auto_19758 - FLEVEL
      ?auto_19756 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19757 ?auto_19759 ) ( NEXT ?auto_19755 ?auto_19758 ) ( not ( = ?auto_19752 ?auto_19759 ) ) ( not ( = ?auto_19758 ?auto_19755 ) ) ( PERSON-AT ?auto_19756 ?auto_19752 ) ( not ( = ?auto_19756 ?auto_19753 ) ) ( PERSON-AT ?auto_19753 ?auto_19759 ) ( FUEL-LEVEL ?auto_19757 ?auto_19755 ) ( PERSON-AT ?auto_19754 ?auto_19752 ) ( not ( = ?auto_19753 ?auto_19754 ) ) ( not ( = ?auto_19754 ?auto_19756 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19756 ?auto_19753 ?auto_19752 )
      ( FLY-2PPL-VERIFY ?auto_19753 ?auto_19754 ?auto_19752 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19769 - PERSON
      ?auto_19770 - PERSON
      ?auto_19771 - PERSON
      ?auto_19768 - CITY
    )
    :vars
    (
      ?auto_19773 - AIRCRAFT
      ?auto_19775 - CITY
      ?auto_19772 - FLEVEL
      ?auto_19774 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19773 ?auto_19775 ) ( NEXT ?auto_19772 ?auto_19774 ) ( not ( = ?auto_19768 ?auto_19775 ) ) ( not ( = ?auto_19774 ?auto_19772 ) ) ( PERSON-AT ?auto_19769 ?auto_19768 ) ( not ( = ?auto_19769 ?auto_19771 ) ) ( PERSON-AT ?auto_19771 ?auto_19775 ) ( FUEL-LEVEL ?auto_19773 ?auto_19772 ) ( PERSON-AT ?auto_19770 ?auto_19768 ) ( not ( = ?auto_19769 ?auto_19770 ) ) ( not ( = ?auto_19770 ?auto_19771 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19769 ?auto_19771 ?auto_19768 )
      ( FLY-3PPL-VERIFY ?auto_19769 ?auto_19770 ?auto_19771 ?auto_19768 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19777 - PERSON
      ?auto_19778 - PERSON
      ?auto_19779 - PERSON
      ?auto_19776 - CITY
    )
    :vars
    (
      ?auto_19781 - AIRCRAFT
      ?auto_19783 - CITY
      ?auto_19780 - FLEVEL
      ?auto_19782 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19781 ?auto_19783 ) ( NEXT ?auto_19780 ?auto_19782 ) ( not ( = ?auto_19776 ?auto_19783 ) ) ( not ( = ?auto_19782 ?auto_19780 ) ) ( PERSON-AT ?auto_19777 ?auto_19776 ) ( not ( = ?auto_19777 ?auto_19779 ) ) ( PERSON-AT ?auto_19779 ?auto_19783 ) ( FUEL-LEVEL ?auto_19781 ?auto_19780 ) ( PERSON-AT ?auto_19778 ?auto_19776 ) ( not ( = ?auto_19777 ?auto_19778 ) ) ( not ( = ?auto_19778 ?auto_19779 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19777 ?auto_19779 ?auto_19776 )
      ( FLY-3PPL-VERIFY ?auto_19777 ?auto_19778 ?auto_19779 ?auto_19776 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19785 - PERSON
      ?auto_19786 - PERSON
      ?auto_19787 - PERSON
      ?auto_19784 - CITY
    )
    :vars
    (
      ?auto_19789 - AIRCRAFT
      ?auto_19791 - CITY
      ?auto_19788 - FLEVEL
      ?auto_19790 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19789 ?auto_19791 ) ( NEXT ?auto_19788 ?auto_19790 ) ( not ( = ?auto_19784 ?auto_19791 ) ) ( not ( = ?auto_19790 ?auto_19788 ) ) ( PERSON-AT ?auto_19787 ?auto_19784 ) ( not ( = ?auto_19787 ?auto_19786 ) ) ( PERSON-AT ?auto_19786 ?auto_19791 ) ( FUEL-LEVEL ?auto_19789 ?auto_19788 ) ( PERSON-AT ?auto_19785 ?auto_19784 ) ( not ( = ?auto_19785 ?auto_19786 ) ) ( not ( = ?auto_19785 ?auto_19787 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19787 ?auto_19786 ?auto_19784 )
      ( FLY-3PPL-VERIFY ?auto_19785 ?auto_19786 ?auto_19787 ?auto_19784 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19793 - PERSON
      ?auto_19794 - PERSON
      ?auto_19795 - PERSON
      ?auto_19792 - CITY
    )
    :vars
    (
      ?auto_19797 - AIRCRAFT
      ?auto_19799 - CITY
      ?auto_19796 - FLEVEL
      ?auto_19798 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19797 ?auto_19799 ) ( NEXT ?auto_19796 ?auto_19798 ) ( not ( = ?auto_19792 ?auto_19799 ) ) ( not ( = ?auto_19798 ?auto_19796 ) ) ( PERSON-AT ?auto_19793 ?auto_19792 ) ( not ( = ?auto_19793 ?auto_19794 ) ) ( PERSON-AT ?auto_19794 ?auto_19799 ) ( FUEL-LEVEL ?auto_19797 ?auto_19796 ) ( PERSON-AT ?auto_19795 ?auto_19792 ) ( not ( = ?auto_19793 ?auto_19795 ) ) ( not ( = ?auto_19794 ?auto_19795 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19793 ?auto_19794 ?auto_19792 )
      ( FLY-3PPL-VERIFY ?auto_19793 ?auto_19794 ?auto_19795 ?auto_19792 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19809 - PERSON
      ?auto_19810 - PERSON
      ?auto_19811 - PERSON
      ?auto_19808 - CITY
    )
    :vars
    (
      ?auto_19813 - AIRCRAFT
      ?auto_19815 - CITY
      ?auto_19812 - FLEVEL
      ?auto_19814 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19813 ?auto_19815 ) ( NEXT ?auto_19812 ?auto_19814 ) ( not ( = ?auto_19808 ?auto_19815 ) ) ( not ( = ?auto_19814 ?auto_19812 ) ) ( PERSON-AT ?auto_19810 ?auto_19808 ) ( not ( = ?auto_19810 ?auto_19811 ) ) ( PERSON-AT ?auto_19811 ?auto_19815 ) ( FUEL-LEVEL ?auto_19813 ?auto_19812 ) ( PERSON-AT ?auto_19809 ?auto_19808 ) ( not ( = ?auto_19809 ?auto_19810 ) ) ( not ( = ?auto_19809 ?auto_19811 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19810 ?auto_19811 ?auto_19808 )
      ( FLY-3PPL-VERIFY ?auto_19809 ?auto_19810 ?auto_19811 ?auto_19808 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19817 - PERSON
      ?auto_19818 - PERSON
      ?auto_19819 - PERSON
      ?auto_19816 - CITY
    )
    :vars
    (
      ?auto_19822 - AIRCRAFT
      ?auto_19824 - CITY
      ?auto_19820 - FLEVEL
      ?auto_19823 - FLEVEL
      ?auto_19821 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19822 ?auto_19824 ) ( NEXT ?auto_19820 ?auto_19823 ) ( not ( = ?auto_19816 ?auto_19824 ) ) ( not ( = ?auto_19823 ?auto_19820 ) ) ( PERSON-AT ?auto_19821 ?auto_19816 ) ( not ( = ?auto_19821 ?auto_19819 ) ) ( PERSON-AT ?auto_19819 ?auto_19824 ) ( FUEL-LEVEL ?auto_19822 ?auto_19820 ) ( PERSON-AT ?auto_19817 ?auto_19816 ) ( PERSON-AT ?auto_19818 ?auto_19816 ) ( not ( = ?auto_19817 ?auto_19818 ) ) ( not ( = ?auto_19817 ?auto_19819 ) ) ( not ( = ?auto_19817 ?auto_19821 ) ) ( not ( = ?auto_19818 ?auto_19819 ) ) ( not ( = ?auto_19818 ?auto_19821 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19821 ?auto_19819 ?auto_19816 )
      ( FLY-3PPL-VERIFY ?auto_19817 ?auto_19818 ?auto_19819 ?auto_19816 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19826 - PERSON
      ?auto_19827 - PERSON
      ?auto_19828 - PERSON
      ?auto_19825 - CITY
    )
    :vars
    (
      ?auto_19830 - AIRCRAFT
      ?auto_19832 - CITY
      ?auto_19829 - FLEVEL
      ?auto_19831 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19830 ?auto_19832 ) ( NEXT ?auto_19829 ?auto_19831 ) ( not ( = ?auto_19825 ?auto_19832 ) ) ( not ( = ?auto_19831 ?auto_19829 ) ) ( PERSON-AT ?auto_19828 ?auto_19825 ) ( not ( = ?auto_19828 ?auto_19827 ) ) ( PERSON-AT ?auto_19827 ?auto_19832 ) ( FUEL-LEVEL ?auto_19830 ?auto_19829 ) ( PERSON-AT ?auto_19826 ?auto_19825 ) ( not ( = ?auto_19826 ?auto_19827 ) ) ( not ( = ?auto_19826 ?auto_19828 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19828 ?auto_19827 ?auto_19825 )
      ( FLY-3PPL-VERIFY ?auto_19826 ?auto_19827 ?auto_19828 ?auto_19825 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19834 - PERSON
      ?auto_19835 - PERSON
      ?auto_19836 - PERSON
      ?auto_19833 - CITY
    )
    :vars
    (
      ?auto_19839 - AIRCRAFT
      ?auto_19841 - CITY
      ?auto_19837 - FLEVEL
      ?auto_19840 - FLEVEL
      ?auto_19838 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19839 ?auto_19841 ) ( NEXT ?auto_19837 ?auto_19840 ) ( not ( = ?auto_19833 ?auto_19841 ) ) ( not ( = ?auto_19840 ?auto_19837 ) ) ( PERSON-AT ?auto_19838 ?auto_19833 ) ( not ( = ?auto_19838 ?auto_19835 ) ) ( PERSON-AT ?auto_19835 ?auto_19841 ) ( FUEL-LEVEL ?auto_19839 ?auto_19837 ) ( PERSON-AT ?auto_19834 ?auto_19833 ) ( PERSON-AT ?auto_19836 ?auto_19833 ) ( not ( = ?auto_19834 ?auto_19835 ) ) ( not ( = ?auto_19834 ?auto_19836 ) ) ( not ( = ?auto_19834 ?auto_19838 ) ) ( not ( = ?auto_19835 ?auto_19836 ) ) ( not ( = ?auto_19836 ?auto_19838 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19838 ?auto_19835 ?auto_19833 )
      ( FLY-3PPL-VERIFY ?auto_19834 ?auto_19835 ?auto_19836 ?auto_19833 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19852 - PERSON
      ?auto_19853 - PERSON
      ?auto_19854 - PERSON
      ?auto_19851 - CITY
    )
    :vars
    (
      ?auto_19856 - AIRCRAFT
      ?auto_19858 - CITY
      ?auto_19855 - FLEVEL
      ?auto_19857 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19856 ?auto_19858 ) ( NEXT ?auto_19855 ?auto_19857 ) ( not ( = ?auto_19851 ?auto_19858 ) ) ( not ( = ?auto_19857 ?auto_19855 ) ) ( PERSON-AT ?auto_19853 ?auto_19851 ) ( not ( = ?auto_19853 ?auto_19852 ) ) ( PERSON-AT ?auto_19852 ?auto_19858 ) ( FUEL-LEVEL ?auto_19856 ?auto_19855 ) ( PERSON-AT ?auto_19854 ?auto_19851 ) ( not ( = ?auto_19852 ?auto_19854 ) ) ( not ( = ?auto_19853 ?auto_19854 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19853 ?auto_19852 ?auto_19851 )
      ( FLY-3PPL-VERIFY ?auto_19852 ?auto_19853 ?auto_19854 ?auto_19851 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19860 - PERSON
      ?auto_19861 - PERSON
      ?auto_19862 - PERSON
      ?auto_19859 - CITY
    )
    :vars
    (
      ?auto_19864 - AIRCRAFT
      ?auto_19866 - CITY
      ?auto_19863 - FLEVEL
      ?auto_19865 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19864 ?auto_19866 ) ( NEXT ?auto_19863 ?auto_19865 ) ( not ( = ?auto_19859 ?auto_19866 ) ) ( not ( = ?auto_19865 ?auto_19863 ) ) ( PERSON-AT ?auto_19861 ?auto_19859 ) ( not ( = ?auto_19861 ?auto_19860 ) ) ( PERSON-AT ?auto_19860 ?auto_19866 ) ( FUEL-LEVEL ?auto_19864 ?auto_19863 ) ( PERSON-AT ?auto_19862 ?auto_19859 ) ( not ( = ?auto_19860 ?auto_19862 ) ) ( not ( = ?auto_19861 ?auto_19862 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19861 ?auto_19860 ?auto_19859 )
      ( FLY-3PPL-VERIFY ?auto_19860 ?auto_19861 ?auto_19862 ?auto_19859 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19876 - PERSON
      ?auto_19877 - PERSON
      ?auto_19878 - PERSON
      ?auto_19875 - CITY
    )
    :vars
    (
      ?auto_19880 - AIRCRAFT
      ?auto_19882 - CITY
      ?auto_19879 - FLEVEL
      ?auto_19881 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19880 ?auto_19882 ) ( NEXT ?auto_19879 ?auto_19881 ) ( not ( = ?auto_19875 ?auto_19882 ) ) ( not ( = ?auto_19881 ?auto_19879 ) ) ( PERSON-AT ?auto_19878 ?auto_19875 ) ( not ( = ?auto_19878 ?auto_19876 ) ) ( PERSON-AT ?auto_19876 ?auto_19882 ) ( FUEL-LEVEL ?auto_19880 ?auto_19879 ) ( PERSON-AT ?auto_19877 ?auto_19875 ) ( not ( = ?auto_19876 ?auto_19877 ) ) ( not ( = ?auto_19877 ?auto_19878 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19878 ?auto_19876 ?auto_19875 )
      ( FLY-3PPL-VERIFY ?auto_19876 ?auto_19877 ?auto_19878 ?auto_19875 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19884 - PERSON
      ?auto_19885 - PERSON
      ?auto_19886 - PERSON
      ?auto_19883 - CITY
    )
    :vars
    (
      ?auto_19889 - AIRCRAFT
      ?auto_19891 - CITY
      ?auto_19887 - FLEVEL
      ?auto_19890 - FLEVEL
      ?auto_19888 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_19889 ?auto_19891 ) ( NEXT ?auto_19887 ?auto_19890 ) ( not ( = ?auto_19883 ?auto_19891 ) ) ( not ( = ?auto_19890 ?auto_19887 ) ) ( PERSON-AT ?auto_19888 ?auto_19883 ) ( not ( = ?auto_19888 ?auto_19884 ) ) ( PERSON-AT ?auto_19884 ?auto_19891 ) ( FUEL-LEVEL ?auto_19889 ?auto_19887 ) ( PERSON-AT ?auto_19885 ?auto_19883 ) ( PERSON-AT ?auto_19886 ?auto_19883 ) ( not ( = ?auto_19884 ?auto_19885 ) ) ( not ( = ?auto_19884 ?auto_19886 ) ) ( not ( = ?auto_19885 ?auto_19886 ) ) ( not ( = ?auto_19885 ?auto_19888 ) ) ( not ( = ?auto_19886 ?auto_19888 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19888 ?auto_19884 ?auto_19883 )
      ( FLY-3PPL-VERIFY ?auto_19884 ?auto_19885 ?auto_19886 ?auto_19883 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_19928 - PERSON
      ?auto_19927 - CITY
    )
    :vars
    (
      ?auto_19929 - FLEVEL
      ?auto_19932 - FLEVEL
      ?auto_19933 - CITY
      ?auto_19930 - PERSON
      ?auto_19931 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19929 ?auto_19932 ) ( not ( = ?auto_19927 ?auto_19933 ) ) ( not ( = ?auto_19932 ?auto_19929 ) ) ( PERSON-AT ?auto_19930 ?auto_19927 ) ( not ( = ?auto_19930 ?auto_19928 ) ) ( PERSON-AT ?auto_19928 ?auto_19933 ) ( AIRCRAFT-AT ?auto_19931 ?auto_19927 ) ( FUEL-LEVEL ?auto_19931 ?auto_19932 ) )
    :subtasks
    ( ( !FLY ?auto_19931 ?auto_19927 ?auto_19933 ?auto_19932 ?auto_19929 )
      ( FLY-2PPL ?auto_19930 ?auto_19928 ?auto_19927 )
      ( FLY-1PPL-VERIFY ?auto_19928 ?auto_19927 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19935 - PERSON
      ?auto_19936 - PERSON
      ?auto_19934 - CITY
    )
    :vars
    (
      ?auto_19939 - FLEVEL
      ?auto_19938 - FLEVEL
      ?auto_19940 - CITY
      ?auto_19937 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19939 ?auto_19938 ) ( not ( = ?auto_19934 ?auto_19940 ) ) ( not ( = ?auto_19938 ?auto_19939 ) ) ( PERSON-AT ?auto_19935 ?auto_19934 ) ( not ( = ?auto_19935 ?auto_19936 ) ) ( PERSON-AT ?auto_19936 ?auto_19940 ) ( AIRCRAFT-AT ?auto_19937 ?auto_19934 ) ( FUEL-LEVEL ?auto_19937 ?auto_19938 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_19936 ?auto_19934 )
      ( FLY-2PPL-VERIFY ?auto_19935 ?auto_19936 ?auto_19934 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19942 - PERSON
      ?auto_19943 - PERSON
      ?auto_19941 - CITY
    )
    :vars
    (
      ?auto_19946 - FLEVEL
      ?auto_19945 - FLEVEL
      ?auto_19944 - CITY
      ?auto_19947 - PERSON
      ?auto_19948 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19946 ?auto_19945 ) ( not ( = ?auto_19941 ?auto_19944 ) ) ( not ( = ?auto_19945 ?auto_19946 ) ) ( PERSON-AT ?auto_19947 ?auto_19941 ) ( not ( = ?auto_19947 ?auto_19943 ) ) ( PERSON-AT ?auto_19943 ?auto_19944 ) ( AIRCRAFT-AT ?auto_19948 ?auto_19941 ) ( FUEL-LEVEL ?auto_19948 ?auto_19945 ) ( PERSON-AT ?auto_19942 ?auto_19941 ) ( not ( = ?auto_19942 ?auto_19943 ) ) ( not ( = ?auto_19942 ?auto_19947 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19947 ?auto_19943 ?auto_19941 )
      ( FLY-2PPL-VERIFY ?auto_19942 ?auto_19943 ?auto_19941 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19950 - PERSON
      ?auto_19951 - PERSON
      ?auto_19949 - CITY
    )
    :vars
    (
      ?auto_19954 - FLEVEL
      ?auto_19953 - FLEVEL
      ?auto_19952 - CITY
      ?auto_19955 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19954 ?auto_19953 ) ( not ( = ?auto_19949 ?auto_19952 ) ) ( not ( = ?auto_19953 ?auto_19954 ) ) ( PERSON-AT ?auto_19951 ?auto_19949 ) ( not ( = ?auto_19951 ?auto_19950 ) ) ( PERSON-AT ?auto_19950 ?auto_19952 ) ( AIRCRAFT-AT ?auto_19955 ?auto_19949 ) ( FUEL-LEVEL ?auto_19955 ?auto_19953 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19951 ?auto_19950 ?auto_19949 )
      ( FLY-2PPL-VERIFY ?auto_19950 ?auto_19951 ?auto_19949 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_19957 - PERSON
      ?auto_19958 - PERSON
      ?auto_19956 - CITY
    )
    :vars
    (
      ?auto_19961 - FLEVEL
      ?auto_19960 - FLEVEL
      ?auto_19959 - CITY
      ?auto_19962 - PERSON
      ?auto_19963 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19961 ?auto_19960 ) ( not ( = ?auto_19956 ?auto_19959 ) ) ( not ( = ?auto_19960 ?auto_19961 ) ) ( PERSON-AT ?auto_19962 ?auto_19956 ) ( not ( = ?auto_19962 ?auto_19957 ) ) ( PERSON-AT ?auto_19957 ?auto_19959 ) ( AIRCRAFT-AT ?auto_19963 ?auto_19956 ) ( FUEL-LEVEL ?auto_19963 ?auto_19960 ) ( PERSON-AT ?auto_19958 ?auto_19956 ) ( not ( = ?auto_19957 ?auto_19958 ) ) ( not ( = ?auto_19958 ?auto_19962 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19962 ?auto_19957 ?auto_19956 )
      ( FLY-2PPL-VERIFY ?auto_19957 ?auto_19958 ?auto_19956 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19973 - PERSON
      ?auto_19974 - PERSON
      ?auto_19975 - PERSON
      ?auto_19972 - CITY
    )
    :vars
    (
      ?auto_19978 - FLEVEL
      ?auto_19977 - FLEVEL
      ?auto_19976 - CITY
      ?auto_19979 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19978 ?auto_19977 ) ( not ( = ?auto_19972 ?auto_19976 ) ) ( not ( = ?auto_19977 ?auto_19978 ) ) ( PERSON-AT ?auto_19974 ?auto_19972 ) ( not ( = ?auto_19974 ?auto_19975 ) ) ( PERSON-AT ?auto_19975 ?auto_19976 ) ( AIRCRAFT-AT ?auto_19979 ?auto_19972 ) ( FUEL-LEVEL ?auto_19979 ?auto_19977 ) ( PERSON-AT ?auto_19973 ?auto_19972 ) ( not ( = ?auto_19973 ?auto_19974 ) ) ( not ( = ?auto_19973 ?auto_19975 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19974 ?auto_19975 ?auto_19972 )
      ( FLY-3PPL-VERIFY ?auto_19973 ?auto_19974 ?auto_19975 ?auto_19972 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19981 - PERSON
      ?auto_19982 - PERSON
      ?auto_19983 - PERSON
      ?auto_19980 - CITY
    )
    :vars
    (
      ?auto_19986 - FLEVEL
      ?auto_19985 - FLEVEL
      ?auto_19984 - CITY
      ?auto_19987 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19986 ?auto_19985 ) ( not ( = ?auto_19980 ?auto_19984 ) ) ( not ( = ?auto_19985 ?auto_19986 ) ) ( PERSON-AT ?auto_19981 ?auto_19980 ) ( not ( = ?auto_19981 ?auto_19983 ) ) ( PERSON-AT ?auto_19983 ?auto_19984 ) ( AIRCRAFT-AT ?auto_19987 ?auto_19980 ) ( FUEL-LEVEL ?auto_19987 ?auto_19985 ) ( PERSON-AT ?auto_19982 ?auto_19980 ) ( not ( = ?auto_19981 ?auto_19982 ) ) ( not ( = ?auto_19982 ?auto_19983 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19981 ?auto_19983 ?auto_19980 )
      ( FLY-3PPL-VERIFY ?auto_19981 ?auto_19982 ?auto_19983 ?auto_19980 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19989 - PERSON
      ?auto_19990 - PERSON
      ?auto_19991 - PERSON
      ?auto_19988 - CITY
    )
    :vars
    (
      ?auto_19994 - FLEVEL
      ?auto_19993 - FLEVEL
      ?auto_19992 - CITY
      ?auto_19995 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_19994 ?auto_19993 ) ( not ( = ?auto_19988 ?auto_19992 ) ) ( not ( = ?auto_19993 ?auto_19994 ) ) ( PERSON-AT ?auto_19991 ?auto_19988 ) ( not ( = ?auto_19991 ?auto_19990 ) ) ( PERSON-AT ?auto_19990 ?auto_19992 ) ( AIRCRAFT-AT ?auto_19995 ?auto_19988 ) ( FUEL-LEVEL ?auto_19995 ?auto_19993 ) ( PERSON-AT ?auto_19989 ?auto_19988 ) ( not ( = ?auto_19989 ?auto_19990 ) ) ( not ( = ?auto_19989 ?auto_19991 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19991 ?auto_19990 ?auto_19988 )
      ( FLY-3PPL-VERIFY ?auto_19989 ?auto_19990 ?auto_19991 ?auto_19988 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_19997 - PERSON
      ?auto_19998 - PERSON
      ?auto_19999 - PERSON
      ?auto_19996 - CITY
    )
    :vars
    (
      ?auto_20002 - FLEVEL
      ?auto_20001 - FLEVEL
      ?auto_20000 - CITY
      ?auto_20003 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20002 ?auto_20001 ) ( not ( = ?auto_19996 ?auto_20000 ) ) ( not ( = ?auto_20001 ?auto_20002 ) ) ( PERSON-AT ?auto_19997 ?auto_19996 ) ( not ( = ?auto_19997 ?auto_19998 ) ) ( PERSON-AT ?auto_19998 ?auto_20000 ) ( AIRCRAFT-AT ?auto_20003 ?auto_19996 ) ( FUEL-LEVEL ?auto_20003 ?auto_20001 ) ( PERSON-AT ?auto_19999 ?auto_19996 ) ( not ( = ?auto_19997 ?auto_19999 ) ) ( not ( = ?auto_19998 ?auto_19999 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_19997 ?auto_19998 ?auto_19996 )
      ( FLY-3PPL-VERIFY ?auto_19997 ?auto_19998 ?auto_19999 ?auto_19996 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20013 - PERSON
      ?auto_20014 - PERSON
      ?auto_20015 - PERSON
      ?auto_20012 - CITY
    )
    :vars
    (
      ?auto_20018 - FLEVEL
      ?auto_20017 - FLEVEL
      ?auto_20016 - CITY
      ?auto_20019 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20018 ?auto_20017 ) ( not ( = ?auto_20012 ?auto_20016 ) ) ( not ( = ?auto_20017 ?auto_20018 ) ) ( PERSON-AT ?auto_20014 ?auto_20012 ) ( not ( = ?auto_20014 ?auto_20015 ) ) ( PERSON-AT ?auto_20015 ?auto_20016 ) ( AIRCRAFT-AT ?auto_20019 ?auto_20012 ) ( FUEL-LEVEL ?auto_20019 ?auto_20017 ) ( PERSON-AT ?auto_20013 ?auto_20012 ) ( not ( = ?auto_20013 ?auto_20014 ) ) ( not ( = ?auto_20013 ?auto_20015 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20014 ?auto_20015 ?auto_20012 )
      ( FLY-3PPL-VERIFY ?auto_20013 ?auto_20014 ?auto_20015 ?auto_20012 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20021 - PERSON
      ?auto_20022 - PERSON
      ?auto_20023 - PERSON
      ?auto_20020 - CITY
    )
    :vars
    (
      ?auto_20026 - FLEVEL
      ?auto_20025 - FLEVEL
      ?auto_20024 - CITY
      ?auto_20027 - PERSON
      ?auto_20028 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20026 ?auto_20025 ) ( not ( = ?auto_20020 ?auto_20024 ) ) ( not ( = ?auto_20025 ?auto_20026 ) ) ( PERSON-AT ?auto_20027 ?auto_20020 ) ( not ( = ?auto_20027 ?auto_20023 ) ) ( PERSON-AT ?auto_20023 ?auto_20024 ) ( AIRCRAFT-AT ?auto_20028 ?auto_20020 ) ( FUEL-LEVEL ?auto_20028 ?auto_20025 ) ( PERSON-AT ?auto_20021 ?auto_20020 ) ( PERSON-AT ?auto_20022 ?auto_20020 ) ( not ( = ?auto_20021 ?auto_20022 ) ) ( not ( = ?auto_20021 ?auto_20023 ) ) ( not ( = ?auto_20021 ?auto_20027 ) ) ( not ( = ?auto_20022 ?auto_20023 ) ) ( not ( = ?auto_20022 ?auto_20027 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20027 ?auto_20023 ?auto_20020 )
      ( FLY-3PPL-VERIFY ?auto_20021 ?auto_20022 ?auto_20023 ?auto_20020 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20030 - PERSON
      ?auto_20031 - PERSON
      ?auto_20032 - PERSON
      ?auto_20029 - CITY
    )
    :vars
    (
      ?auto_20035 - FLEVEL
      ?auto_20034 - FLEVEL
      ?auto_20033 - CITY
      ?auto_20036 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20035 ?auto_20034 ) ( not ( = ?auto_20029 ?auto_20033 ) ) ( not ( = ?auto_20034 ?auto_20035 ) ) ( PERSON-AT ?auto_20032 ?auto_20029 ) ( not ( = ?auto_20032 ?auto_20031 ) ) ( PERSON-AT ?auto_20031 ?auto_20033 ) ( AIRCRAFT-AT ?auto_20036 ?auto_20029 ) ( FUEL-LEVEL ?auto_20036 ?auto_20034 ) ( PERSON-AT ?auto_20030 ?auto_20029 ) ( not ( = ?auto_20030 ?auto_20031 ) ) ( not ( = ?auto_20030 ?auto_20032 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20032 ?auto_20031 ?auto_20029 )
      ( FLY-3PPL-VERIFY ?auto_20030 ?auto_20031 ?auto_20032 ?auto_20029 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20038 - PERSON
      ?auto_20039 - PERSON
      ?auto_20040 - PERSON
      ?auto_20037 - CITY
    )
    :vars
    (
      ?auto_20043 - FLEVEL
      ?auto_20042 - FLEVEL
      ?auto_20041 - CITY
      ?auto_20044 - PERSON
      ?auto_20045 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20043 ?auto_20042 ) ( not ( = ?auto_20037 ?auto_20041 ) ) ( not ( = ?auto_20042 ?auto_20043 ) ) ( PERSON-AT ?auto_20044 ?auto_20037 ) ( not ( = ?auto_20044 ?auto_20039 ) ) ( PERSON-AT ?auto_20039 ?auto_20041 ) ( AIRCRAFT-AT ?auto_20045 ?auto_20037 ) ( FUEL-LEVEL ?auto_20045 ?auto_20042 ) ( PERSON-AT ?auto_20038 ?auto_20037 ) ( PERSON-AT ?auto_20040 ?auto_20037 ) ( not ( = ?auto_20038 ?auto_20039 ) ) ( not ( = ?auto_20038 ?auto_20040 ) ) ( not ( = ?auto_20038 ?auto_20044 ) ) ( not ( = ?auto_20039 ?auto_20040 ) ) ( not ( = ?auto_20040 ?auto_20044 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20044 ?auto_20039 ?auto_20037 )
      ( FLY-3PPL-VERIFY ?auto_20038 ?auto_20039 ?auto_20040 ?auto_20037 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20056 - PERSON
      ?auto_20057 - PERSON
      ?auto_20058 - PERSON
      ?auto_20055 - CITY
    )
    :vars
    (
      ?auto_20061 - FLEVEL
      ?auto_20060 - FLEVEL
      ?auto_20059 - CITY
      ?auto_20062 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20061 ?auto_20060 ) ( not ( = ?auto_20055 ?auto_20059 ) ) ( not ( = ?auto_20060 ?auto_20061 ) ) ( PERSON-AT ?auto_20057 ?auto_20055 ) ( not ( = ?auto_20057 ?auto_20056 ) ) ( PERSON-AT ?auto_20056 ?auto_20059 ) ( AIRCRAFT-AT ?auto_20062 ?auto_20055 ) ( FUEL-LEVEL ?auto_20062 ?auto_20060 ) ( PERSON-AT ?auto_20058 ?auto_20055 ) ( not ( = ?auto_20056 ?auto_20058 ) ) ( not ( = ?auto_20057 ?auto_20058 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20057 ?auto_20056 ?auto_20055 )
      ( FLY-3PPL-VERIFY ?auto_20056 ?auto_20057 ?auto_20058 ?auto_20055 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20064 - PERSON
      ?auto_20065 - PERSON
      ?auto_20066 - PERSON
      ?auto_20063 - CITY
    )
    :vars
    (
      ?auto_20069 - FLEVEL
      ?auto_20068 - FLEVEL
      ?auto_20067 - CITY
      ?auto_20070 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20069 ?auto_20068 ) ( not ( = ?auto_20063 ?auto_20067 ) ) ( not ( = ?auto_20068 ?auto_20069 ) ) ( PERSON-AT ?auto_20065 ?auto_20063 ) ( not ( = ?auto_20065 ?auto_20064 ) ) ( PERSON-AT ?auto_20064 ?auto_20067 ) ( AIRCRAFT-AT ?auto_20070 ?auto_20063 ) ( FUEL-LEVEL ?auto_20070 ?auto_20068 ) ( PERSON-AT ?auto_20066 ?auto_20063 ) ( not ( = ?auto_20064 ?auto_20066 ) ) ( not ( = ?auto_20065 ?auto_20066 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20065 ?auto_20064 ?auto_20063 )
      ( FLY-3PPL-VERIFY ?auto_20064 ?auto_20065 ?auto_20066 ?auto_20063 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20080 - PERSON
      ?auto_20081 - PERSON
      ?auto_20082 - PERSON
      ?auto_20079 - CITY
    )
    :vars
    (
      ?auto_20085 - FLEVEL
      ?auto_20084 - FLEVEL
      ?auto_20083 - CITY
      ?auto_20086 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20085 ?auto_20084 ) ( not ( = ?auto_20079 ?auto_20083 ) ) ( not ( = ?auto_20084 ?auto_20085 ) ) ( PERSON-AT ?auto_20082 ?auto_20079 ) ( not ( = ?auto_20082 ?auto_20080 ) ) ( PERSON-AT ?auto_20080 ?auto_20083 ) ( AIRCRAFT-AT ?auto_20086 ?auto_20079 ) ( FUEL-LEVEL ?auto_20086 ?auto_20084 ) ( PERSON-AT ?auto_20081 ?auto_20079 ) ( not ( = ?auto_20080 ?auto_20081 ) ) ( not ( = ?auto_20081 ?auto_20082 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20082 ?auto_20080 ?auto_20079 )
      ( FLY-3PPL-VERIFY ?auto_20080 ?auto_20081 ?auto_20082 ?auto_20079 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20088 - PERSON
      ?auto_20089 - PERSON
      ?auto_20090 - PERSON
      ?auto_20087 - CITY
    )
    :vars
    (
      ?auto_20093 - FLEVEL
      ?auto_20092 - FLEVEL
      ?auto_20091 - CITY
      ?auto_20094 - PERSON
      ?auto_20095 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20093 ?auto_20092 ) ( not ( = ?auto_20087 ?auto_20091 ) ) ( not ( = ?auto_20092 ?auto_20093 ) ) ( PERSON-AT ?auto_20094 ?auto_20087 ) ( not ( = ?auto_20094 ?auto_20088 ) ) ( PERSON-AT ?auto_20088 ?auto_20091 ) ( AIRCRAFT-AT ?auto_20095 ?auto_20087 ) ( FUEL-LEVEL ?auto_20095 ?auto_20092 ) ( PERSON-AT ?auto_20089 ?auto_20087 ) ( PERSON-AT ?auto_20090 ?auto_20087 ) ( not ( = ?auto_20088 ?auto_20089 ) ) ( not ( = ?auto_20088 ?auto_20090 ) ) ( not ( = ?auto_20089 ?auto_20090 ) ) ( not ( = ?auto_20089 ?auto_20094 ) ) ( not ( = ?auto_20090 ?auto_20094 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20094 ?auto_20088 ?auto_20087 )
      ( FLY-3PPL-VERIFY ?auto_20088 ?auto_20089 ?auto_20090 ?auto_20087 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_20132 - PERSON
      ?auto_20131 - CITY
    )
    :vars
    (
      ?auto_20135 - FLEVEL
      ?auto_20134 - FLEVEL
      ?auto_20133 - CITY
      ?auto_20136 - PERSON
      ?auto_20137 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20135 ?auto_20134 ) ( not ( = ?auto_20131 ?auto_20133 ) ) ( not ( = ?auto_20134 ?auto_20135 ) ) ( PERSON-AT ?auto_20136 ?auto_20131 ) ( not ( = ?auto_20136 ?auto_20132 ) ) ( PERSON-AT ?auto_20132 ?auto_20133 ) ( AIRCRAFT-AT ?auto_20137 ?auto_20131 ) ( FUEL-LEVEL ?auto_20137 ?auto_20135 ) )
    :subtasks
    ( ( !REFUEL ?auto_20137 ?auto_20131 ?auto_20135 ?auto_20134 )
      ( FLY-2PPL ?auto_20136 ?auto_20132 ?auto_20131 )
      ( FLY-1PPL-VERIFY ?auto_20132 ?auto_20131 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20139 - PERSON
      ?auto_20140 - PERSON
      ?auto_20138 - CITY
    )
    :vars
    (
      ?auto_20143 - FLEVEL
      ?auto_20144 - FLEVEL
      ?auto_20141 - CITY
      ?auto_20142 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20143 ?auto_20144 ) ( not ( = ?auto_20138 ?auto_20141 ) ) ( not ( = ?auto_20144 ?auto_20143 ) ) ( PERSON-AT ?auto_20139 ?auto_20138 ) ( not ( = ?auto_20139 ?auto_20140 ) ) ( PERSON-AT ?auto_20140 ?auto_20141 ) ( AIRCRAFT-AT ?auto_20142 ?auto_20138 ) ( FUEL-LEVEL ?auto_20142 ?auto_20143 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_20140 ?auto_20138 )
      ( FLY-2PPL-VERIFY ?auto_20139 ?auto_20140 ?auto_20138 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20146 - PERSON
      ?auto_20147 - PERSON
      ?auto_20145 - CITY
    )
    :vars
    (
      ?auto_20151 - FLEVEL
      ?auto_20148 - FLEVEL
      ?auto_20149 - CITY
      ?auto_20152 - PERSON
      ?auto_20150 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20151 ?auto_20148 ) ( not ( = ?auto_20145 ?auto_20149 ) ) ( not ( = ?auto_20148 ?auto_20151 ) ) ( PERSON-AT ?auto_20152 ?auto_20145 ) ( not ( = ?auto_20152 ?auto_20147 ) ) ( PERSON-AT ?auto_20147 ?auto_20149 ) ( AIRCRAFT-AT ?auto_20150 ?auto_20145 ) ( FUEL-LEVEL ?auto_20150 ?auto_20151 ) ( PERSON-AT ?auto_20146 ?auto_20145 ) ( not ( = ?auto_20146 ?auto_20147 ) ) ( not ( = ?auto_20146 ?auto_20152 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20152 ?auto_20147 ?auto_20145 )
      ( FLY-2PPL-VERIFY ?auto_20146 ?auto_20147 ?auto_20145 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20154 - PERSON
      ?auto_20155 - PERSON
      ?auto_20153 - CITY
    )
    :vars
    (
      ?auto_20159 - FLEVEL
      ?auto_20156 - FLEVEL
      ?auto_20157 - CITY
      ?auto_20158 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20159 ?auto_20156 ) ( not ( = ?auto_20153 ?auto_20157 ) ) ( not ( = ?auto_20156 ?auto_20159 ) ) ( PERSON-AT ?auto_20155 ?auto_20153 ) ( not ( = ?auto_20155 ?auto_20154 ) ) ( PERSON-AT ?auto_20154 ?auto_20157 ) ( AIRCRAFT-AT ?auto_20158 ?auto_20153 ) ( FUEL-LEVEL ?auto_20158 ?auto_20159 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20155 ?auto_20154 ?auto_20153 )
      ( FLY-2PPL-VERIFY ?auto_20154 ?auto_20155 ?auto_20153 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20161 - PERSON
      ?auto_20162 - PERSON
      ?auto_20160 - CITY
    )
    :vars
    (
      ?auto_20166 - FLEVEL
      ?auto_20163 - FLEVEL
      ?auto_20164 - CITY
      ?auto_20167 - PERSON
      ?auto_20165 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20166 ?auto_20163 ) ( not ( = ?auto_20160 ?auto_20164 ) ) ( not ( = ?auto_20163 ?auto_20166 ) ) ( PERSON-AT ?auto_20167 ?auto_20160 ) ( not ( = ?auto_20167 ?auto_20161 ) ) ( PERSON-AT ?auto_20161 ?auto_20164 ) ( AIRCRAFT-AT ?auto_20165 ?auto_20160 ) ( FUEL-LEVEL ?auto_20165 ?auto_20166 ) ( PERSON-AT ?auto_20162 ?auto_20160 ) ( not ( = ?auto_20161 ?auto_20162 ) ) ( not ( = ?auto_20162 ?auto_20167 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20167 ?auto_20161 ?auto_20160 )
      ( FLY-2PPL-VERIFY ?auto_20161 ?auto_20162 ?auto_20160 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20177 - PERSON
      ?auto_20178 - PERSON
      ?auto_20179 - PERSON
      ?auto_20176 - CITY
    )
    :vars
    (
      ?auto_20183 - FLEVEL
      ?auto_20180 - FLEVEL
      ?auto_20181 - CITY
      ?auto_20182 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20183 ?auto_20180 ) ( not ( = ?auto_20176 ?auto_20181 ) ) ( not ( = ?auto_20180 ?auto_20183 ) ) ( PERSON-AT ?auto_20178 ?auto_20176 ) ( not ( = ?auto_20178 ?auto_20179 ) ) ( PERSON-AT ?auto_20179 ?auto_20181 ) ( AIRCRAFT-AT ?auto_20182 ?auto_20176 ) ( FUEL-LEVEL ?auto_20182 ?auto_20183 ) ( PERSON-AT ?auto_20177 ?auto_20176 ) ( not ( = ?auto_20177 ?auto_20178 ) ) ( not ( = ?auto_20177 ?auto_20179 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20178 ?auto_20179 ?auto_20176 )
      ( FLY-3PPL-VERIFY ?auto_20177 ?auto_20178 ?auto_20179 ?auto_20176 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20185 - PERSON
      ?auto_20186 - PERSON
      ?auto_20187 - PERSON
      ?auto_20184 - CITY
    )
    :vars
    (
      ?auto_20191 - FLEVEL
      ?auto_20188 - FLEVEL
      ?auto_20189 - CITY
      ?auto_20190 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20191 ?auto_20188 ) ( not ( = ?auto_20184 ?auto_20189 ) ) ( not ( = ?auto_20188 ?auto_20191 ) ) ( PERSON-AT ?auto_20185 ?auto_20184 ) ( not ( = ?auto_20185 ?auto_20187 ) ) ( PERSON-AT ?auto_20187 ?auto_20189 ) ( AIRCRAFT-AT ?auto_20190 ?auto_20184 ) ( FUEL-LEVEL ?auto_20190 ?auto_20191 ) ( PERSON-AT ?auto_20186 ?auto_20184 ) ( not ( = ?auto_20185 ?auto_20186 ) ) ( not ( = ?auto_20186 ?auto_20187 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20185 ?auto_20187 ?auto_20184 )
      ( FLY-3PPL-VERIFY ?auto_20185 ?auto_20186 ?auto_20187 ?auto_20184 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20193 - PERSON
      ?auto_20194 - PERSON
      ?auto_20195 - PERSON
      ?auto_20192 - CITY
    )
    :vars
    (
      ?auto_20199 - FLEVEL
      ?auto_20196 - FLEVEL
      ?auto_20197 - CITY
      ?auto_20198 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20199 ?auto_20196 ) ( not ( = ?auto_20192 ?auto_20197 ) ) ( not ( = ?auto_20196 ?auto_20199 ) ) ( PERSON-AT ?auto_20195 ?auto_20192 ) ( not ( = ?auto_20195 ?auto_20194 ) ) ( PERSON-AT ?auto_20194 ?auto_20197 ) ( AIRCRAFT-AT ?auto_20198 ?auto_20192 ) ( FUEL-LEVEL ?auto_20198 ?auto_20199 ) ( PERSON-AT ?auto_20193 ?auto_20192 ) ( not ( = ?auto_20193 ?auto_20194 ) ) ( not ( = ?auto_20193 ?auto_20195 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20195 ?auto_20194 ?auto_20192 )
      ( FLY-3PPL-VERIFY ?auto_20193 ?auto_20194 ?auto_20195 ?auto_20192 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20201 - PERSON
      ?auto_20202 - PERSON
      ?auto_20203 - PERSON
      ?auto_20200 - CITY
    )
    :vars
    (
      ?auto_20207 - FLEVEL
      ?auto_20204 - FLEVEL
      ?auto_20205 - CITY
      ?auto_20206 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20207 ?auto_20204 ) ( not ( = ?auto_20200 ?auto_20205 ) ) ( not ( = ?auto_20204 ?auto_20207 ) ) ( PERSON-AT ?auto_20201 ?auto_20200 ) ( not ( = ?auto_20201 ?auto_20202 ) ) ( PERSON-AT ?auto_20202 ?auto_20205 ) ( AIRCRAFT-AT ?auto_20206 ?auto_20200 ) ( FUEL-LEVEL ?auto_20206 ?auto_20207 ) ( PERSON-AT ?auto_20203 ?auto_20200 ) ( not ( = ?auto_20201 ?auto_20203 ) ) ( not ( = ?auto_20202 ?auto_20203 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20201 ?auto_20202 ?auto_20200 )
      ( FLY-3PPL-VERIFY ?auto_20201 ?auto_20202 ?auto_20203 ?auto_20200 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20217 - PERSON
      ?auto_20218 - PERSON
      ?auto_20219 - PERSON
      ?auto_20216 - CITY
    )
    :vars
    (
      ?auto_20223 - FLEVEL
      ?auto_20220 - FLEVEL
      ?auto_20221 - CITY
      ?auto_20222 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20223 ?auto_20220 ) ( not ( = ?auto_20216 ?auto_20221 ) ) ( not ( = ?auto_20220 ?auto_20223 ) ) ( PERSON-AT ?auto_20218 ?auto_20216 ) ( not ( = ?auto_20218 ?auto_20219 ) ) ( PERSON-AT ?auto_20219 ?auto_20221 ) ( AIRCRAFT-AT ?auto_20222 ?auto_20216 ) ( FUEL-LEVEL ?auto_20222 ?auto_20223 ) ( PERSON-AT ?auto_20217 ?auto_20216 ) ( not ( = ?auto_20217 ?auto_20218 ) ) ( not ( = ?auto_20217 ?auto_20219 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20218 ?auto_20219 ?auto_20216 )
      ( FLY-3PPL-VERIFY ?auto_20217 ?auto_20218 ?auto_20219 ?auto_20216 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20225 - PERSON
      ?auto_20226 - PERSON
      ?auto_20227 - PERSON
      ?auto_20224 - CITY
    )
    :vars
    (
      ?auto_20231 - FLEVEL
      ?auto_20228 - FLEVEL
      ?auto_20229 - CITY
      ?auto_20232 - PERSON
      ?auto_20230 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20231 ?auto_20228 ) ( not ( = ?auto_20224 ?auto_20229 ) ) ( not ( = ?auto_20228 ?auto_20231 ) ) ( PERSON-AT ?auto_20232 ?auto_20224 ) ( not ( = ?auto_20232 ?auto_20227 ) ) ( PERSON-AT ?auto_20227 ?auto_20229 ) ( AIRCRAFT-AT ?auto_20230 ?auto_20224 ) ( FUEL-LEVEL ?auto_20230 ?auto_20231 ) ( PERSON-AT ?auto_20225 ?auto_20224 ) ( PERSON-AT ?auto_20226 ?auto_20224 ) ( not ( = ?auto_20225 ?auto_20226 ) ) ( not ( = ?auto_20225 ?auto_20227 ) ) ( not ( = ?auto_20225 ?auto_20232 ) ) ( not ( = ?auto_20226 ?auto_20227 ) ) ( not ( = ?auto_20226 ?auto_20232 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20232 ?auto_20227 ?auto_20224 )
      ( FLY-3PPL-VERIFY ?auto_20225 ?auto_20226 ?auto_20227 ?auto_20224 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20234 - PERSON
      ?auto_20235 - PERSON
      ?auto_20236 - PERSON
      ?auto_20233 - CITY
    )
    :vars
    (
      ?auto_20240 - FLEVEL
      ?auto_20237 - FLEVEL
      ?auto_20238 - CITY
      ?auto_20239 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20240 ?auto_20237 ) ( not ( = ?auto_20233 ?auto_20238 ) ) ( not ( = ?auto_20237 ?auto_20240 ) ) ( PERSON-AT ?auto_20236 ?auto_20233 ) ( not ( = ?auto_20236 ?auto_20235 ) ) ( PERSON-AT ?auto_20235 ?auto_20238 ) ( AIRCRAFT-AT ?auto_20239 ?auto_20233 ) ( FUEL-LEVEL ?auto_20239 ?auto_20240 ) ( PERSON-AT ?auto_20234 ?auto_20233 ) ( not ( = ?auto_20234 ?auto_20235 ) ) ( not ( = ?auto_20234 ?auto_20236 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20236 ?auto_20235 ?auto_20233 )
      ( FLY-3PPL-VERIFY ?auto_20234 ?auto_20235 ?auto_20236 ?auto_20233 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20242 - PERSON
      ?auto_20243 - PERSON
      ?auto_20244 - PERSON
      ?auto_20241 - CITY
    )
    :vars
    (
      ?auto_20248 - FLEVEL
      ?auto_20245 - FLEVEL
      ?auto_20246 - CITY
      ?auto_20249 - PERSON
      ?auto_20247 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20248 ?auto_20245 ) ( not ( = ?auto_20241 ?auto_20246 ) ) ( not ( = ?auto_20245 ?auto_20248 ) ) ( PERSON-AT ?auto_20249 ?auto_20241 ) ( not ( = ?auto_20249 ?auto_20243 ) ) ( PERSON-AT ?auto_20243 ?auto_20246 ) ( AIRCRAFT-AT ?auto_20247 ?auto_20241 ) ( FUEL-LEVEL ?auto_20247 ?auto_20248 ) ( PERSON-AT ?auto_20242 ?auto_20241 ) ( PERSON-AT ?auto_20244 ?auto_20241 ) ( not ( = ?auto_20242 ?auto_20243 ) ) ( not ( = ?auto_20242 ?auto_20244 ) ) ( not ( = ?auto_20242 ?auto_20249 ) ) ( not ( = ?auto_20243 ?auto_20244 ) ) ( not ( = ?auto_20244 ?auto_20249 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20249 ?auto_20243 ?auto_20241 )
      ( FLY-3PPL-VERIFY ?auto_20242 ?auto_20243 ?auto_20244 ?auto_20241 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20260 - PERSON
      ?auto_20261 - PERSON
      ?auto_20262 - PERSON
      ?auto_20259 - CITY
    )
    :vars
    (
      ?auto_20266 - FLEVEL
      ?auto_20263 - FLEVEL
      ?auto_20264 - CITY
      ?auto_20265 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20266 ?auto_20263 ) ( not ( = ?auto_20259 ?auto_20264 ) ) ( not ( = ?auto_20263 ?auto_20266 ) ) ( PERSON-AT ?auto_20261 ?auto_20259 ) ( not ( = ?auto_20261 ?auto_20260 ) ) ( PERSON-AT ?auto_20260 ?auto_20264 ) ( AIRCRAFT-AT ?auto_20265 ?auto_20259 ) ( FUEL-LEVEL ?auto_20265 ?auto_20266 ) ( PERSON-AT ?auto_20262 ?auto_20259 ) ( not ( = ?auto_20260 ?auto_20262 ) ) ( not ( = ?auto_20261 ?auto_20262 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20261 ?auto_20260 ?auto_20259 )
      ( FLY-3PPL-VERIFY ?auto_20260 ?auto_20261 ?auto_20262 ?auto_20259 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20268 - PERSON
      ?auto_20269 - PERSON
      ?auto_20270 - PERSON
      ?auto_20267 - CITY
    )
    :vars
    (
      ?auto_20274 - FLEVEL
      ?auto_20271 - FLEVEL
      ?auto_20272 - CITY
      ?auto_20273 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20274 ?auto_20271 ) ( not ( = ?auto_20267 ?auto_20272 ) ) ( not ( = ?auto_20271 ?auto_20274 ) ) ( PERSON-AT ?auto_20269 ?auto_20267 ) ( not ( = ?auto_20269 ?auto_20268 ) ) ( PERSON-AT ?auto_20268 ?auto_20272 ) ( AIRCRAFT-AT ?auto_20273 ?auto_20267 ) ( FUEL-LEVEL ?auto_20273 ?auto_20274 ) ( PERSON-AT ?auto_20270 ?auto_20267 ) ( not ( = ?auto_20268 ?auto_20270 ) ) ( not ( = ?auto_20269 ?auto_20270 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20269 ?auto_20268 ?auto_20267 )
      ( FLY-3PPL-VERIFY ?auto_20268 ?auto_20269 ?auto_20270 ?auto_20267 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20284 - PERSON
      ?auto_20285 - PERSON
      ?auto_20286 - PERSON
      ?auto_20283 - CITY
    )
    :vars
    (
      ?auto_20290 - FLEVEL
      ?auto_20287 - FLEVEL
      ?auto_20288 - CITY
      ?auto_20289 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20290 ?auto_20287 ) ( not ( = ?auto_20283 ?auto_20288 ) ) ( not ( = ?auto_20287 ?auto_20290 ) ) ( PERSON-AT ?auto_20286 ?auto_20283 ) ( not ( = ?auto_20286 ?auto_20284 ) ) ( PERSON-AT ?auto_20284 ?auto_20288 ) ( AIRCRAFT-AT ?auto_20289 ?auto_20283 ) ( FUEL-LEVEL ?auto_20289 ?auto_20290 ) ( PERSON-AT ?auto_20285 ?auto_20283 ) ( not ( = ?auto_20284 ?auto_20285 ) ) ( not ( = ?auto_20285 ?auto_20286 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20286 ?auto_20284 ?auto_20283 )
      ( FLY-3PPL-VERIFY ?auto_20284 ?auto_20285 ?auto_20286 ?auto_20283 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20292 - PERSON
      ?auto_20293 - PERSON
      ?auto_20294 - PERSON
      ?auto_20291 - CITY
    )
    :vars
    (
      ?auto_20298 - FLEVEL
      ?auto_20295 - FLEVEL
      ?auto_20296 - CITY
      ?auto_20299 - PERSON
      ?auto_20297 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20298 ?auto_20295 ) ( not ( = ?auto_20291 ?auto_20296 ) ) ( not ( = ?auto_20295 ?auto_20298 ) ) ( PERSON-AT ?auto_20299 ?auto_20291 ) ( not ( = ?auto_20299 ?auto_20292 ) ) ( PERSON-AT ?auto_20292 ?auto_20296 ) ( AIRCRAFT-AT ?auto_20297 ?auto_20291 ) ( FUEL-LEVEL ?auto_20297 ?auto_20298 ) ( PERSON-AT ?auto_20293 ?auto_20291 ) ( PERSON-AT ?auto_20294 ?auto_20291 ) ( not ( = ?auto_20292 ?auto_20293 ) ) ( not ( = ?auto_20292 ?auto_20294 ) ) ( not ( = ?auto_20293 ?auto_20294 ) ) ( not ( = ?auto_20293 ?auto_20299 ) ) ( not ( = ?auto_20294 ?auto_20299 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20299 ?auto_20292 ?auto_20291 )
      ( FLY-3PPL-VERIFY ?auto_20292 ?auto_20293 ?auto_20294 ?auto_20291 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_20336 - PERSON
      ?auto_20335 - CITY
    )
    :vars
    (
      ?auto_20340 - FLEVEL
      ?auto_20337 - FLEVEL
      ?auto_20338 - CITY
      ?auto_20341 - PERSON
      ?auto_20339 - AIRCRAFT
      ?auto_20342 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_20340 ?auto_20337 ) ( not ( = ?auto_20335 ?auto_20338 ) ) ( not ( = ?auto_20337 ?auto_20340 ) ) ( PERSON-AT ?auto_20341 ?auto_20335 ) ( not ( = ?auto_20341 ?auto_20336 ) ) ( PERSON-AT ?auto_20336 ?auto_20338 ) ( AIRCRAFT-AT ?auto_20339 ?auto_20335 ) ( FUEL-LEVEL ?auto_20339 ?auto_20340 ) ( IN ?auto_20342 ?auto_20339 ) ( not ( = ?auto_20341 ?auto_20342 ) ) ( not ( = ?auto_20336 ?auto_20342 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20341 ?auto_20342 ?auto_20335 )
      ( FLY-2PPL ?auto_20341 ?auto_20336 ?auto_20335 )
      ( FLY-1PPL-VERIFY ?auto_20336 ?auto_20335 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20344 - PERSON
      ?auto_20345 - PERSON
      ?auto_20343 - CITY
    )
    :vars
    (
      ?auto_20350 - FLEVEL
      ?auto_20347 - FLEVEL
      ?auto_20348 - CITY
      ?auto_20346 - AIRCRAFT
      ?auto_20349 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_20350 ?auto_20347 ) ( not ( = ?auto_20343 ?auto_20348 ) ) ( not ( = ?auto_20347 ?auto_20350 ) ) ( PERSON-AT ?auto_20344 ?auto_20343 ) ( not ( = ?auto_20344 ?auto_20345 ) ) ( PERSON-AT ?auto_20345 ?auto_20348 ) ( AIRCRAFT-AT ?auto_20346 ?auto_20343 ) ( FUEL-LEVEL ?auto_20346 ?auto_20350 ) ( IN ?auto_20349 ?auto_20346 ) ( not ( = ?auto_20344 ?auto_20349 ) ) ( not ( = ?auto_20345 ?auto_20349 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_20345 ?auto_20343 )
      ( FLY-2PPL-VERIFY ?auto_20344 ?auto_20345 ?auto_20343 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20352 - PERSON
      ?auto_20353 - PERSON
      ?auto_20351 - CITY
    )
    :vars
    (
      ?auto_20356 - FLEVEL
      ?auto_20355 - FLEVEL
      ?auto_20354 - CITY
      ?auto_20358 - PERSON
      ?auto_20357 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20356 ?auto_20355 ) ( not ( = ?auto_20351 ?auto_20354 ) ) ( not ( = ?auto_20355 ?auto_20356 ) ) ( PERSON-AT ?auto_20358 ?auto_20351 ) ( not ( = ?auto_20358 ?auto_20353 ) ) ( PERSON-AT ?auto_20353 ?auto_20354 ) ( AIRCRAFT-AT ?auto_20357 ?auto_20351 ) ( FUEL-LEVEL ?auto_20357 ?auto_20356 ) ( IN ?auto_20352 ?auto_20357 ) ( not ( = ?auto_20358 ?auto_20352 ) ) ( not ( = ?auto_20353 ?auto_20352 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20358 ?auto_20353 ?auto_20351 )
      ( FLY-2PPL-VERIFY ?auto_20352 ?auto_20353 ?auto_20351 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20360 - PERSON
      ?auto_20361 - PERSON
      ?auto_20359 - CITY
    )
    :vars
    (
      ?auto_20364 - FLEVEL
      ?auto_20363 - FLEVEL
      ?auto_20362 - CITY
      ?auto_20366 - AIRCRAFT
      ?auto_20365 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_20364 ?auto_20363 ) ( not ( = ?auto_20359 ?auto_20362 ) ) ( not ( = ?auto_20363 ?auto_20364 ) ) ( PERSON-AT ?auto_20361 ?auto_20359 ) ( not ( = ?auto_20361 ?auto_20360 ) ) ( PERSON-AT ?auto_20360 ?auto_20362 ) ( AIRCRAFT-AT ?auto_20366 ?auto_20359 ) ( FUEL-LEVEL ?auto_20366 ?auto_20364 ) ( IN ?auto_20365 ?auto_20366 ) ( not ( = ?auto_20361 ?auto_20365 ) ) ( not ( = ?auto_20360 ?auto_20365 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20361 ?auto_20360 ?auto_20359 )
      ( FLY-2PPL-VERIFY ?auto_20360 ?auto_20361 ?auto_20359 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20368 - PERSON
      ?auto_20369 - PERSON
      ?auto_20367 - CITY
    )
    :vars
    (
      ?auto_20372 - FLEVEL
      ?auto_20371 - FLEVEL
      ?auto_20370 - CITY
      ?auto_20374 - PERSON
      ?auto_20373 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20372 ?auto_20371 ) ( not ( = ?auto_20367 ?auto_20370 ) ) ( not ( = ?auto_20371 ?auto_20372 ) ) ( PERSON-AT ?auto_20374 ?auto_20367 ) ( not ( = ?auto_20374 ?auto_20368 ) ) ( PERSON-AT ?auto_20368 ?auto_20370 ) ( AIRCRAFT-AT ?auto_20373 ?auto_20367 ) ( FUEL-LEVEL ?auto_20373 ?auto_20372 ) ( IN ?auto_20369 ?auto_20373 ) ( not ( = ?auto_20374 ?auto_20369 ) ) ( not ( = ?auto_20368 ?auto_20369 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20374 ?auto_20368 ?auto_20367 )
      ( FLY-2PPL-VERIFY ?auto_20368 ?auto_20369 ?auto_20367 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20385 - PERSON
      ?auto_20386 - PERSON
      ?auto_20387 - PERSON
      ?auto_20384 - CITY
    )
    :vars
    (
      ?auto_20390 - FLEVEL
      ?auto_20389 - FLEVEL
      ?auto_20388 - CITY
      ?auto_20392 - AIRCRAFT
      ?auto_20391 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_20390 ?auto_20389 ) ( not ( = ?auto_20384 ?auto_20388 ) ) ( not ( = ?auto_20389 ?auto_20390 ) ) ( PERSON-AT ?auto_20385 ?auto_20384 ) ( not ( = ?auto_20385 ?auto_20387 ) ) ( PERSON-AT ?auto_20387 ?auto_20388 ) ( AIRCRAFT-AT ?auto_20392 ?auto_20384 ) ( FUEL-LEVEL ?auto_20392 ?auto_20390 ) ( IN ?auto_20391 ?auto_20392 ) ( not ( = ?auto_20385 ?auto_20391 ) ) ( not ( = ?auto_20387 ?auto_20391 ) ) ( PERSON-AT ?auto_20386 ?auto_20384 ) ( not ( = ?auto_20385 ?auto_20386 ) ) ( not ( = ?auto_20386 ?auto_20387 ) ) ( not ( = ?auto_20386 ?auto_20391 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20385 ?auto_20387 ?auto_20384 )
      ( FLY-3PPL-VERIFY ?auto_20385 ?auto_20386 ?auto_20387 ?auto_20384 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20394 - PERSON
      ?auto_20395 - PERSON
      ?auto_20396 - PERSON
      ?auto_20393 - CITY
    )
    :vars
    (
      ?auto_20399 - FLEVEL
      ?auto_20398 - FLEVEL
      ?auto_20397 - CITY
      ?auto_20400 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20399 ?auto_20398 ) ( not ( = ?auto_20393 ?auto_20397 ) ) ( not ( = ?auto_20398 ?auto_20399 ) ) ( PERSON-AT ?auto_20394 ?auto_20393 ) ( not ( = ?auto_20394 ?auto_20396 ) ) ( PERSON-AT ?auto_20396 ?auto_20397 ) ( AIRCRAFT-AT ?auto_20400 ?auto_20393 ) ( FUEL-LEVEL ?auto_20400 ?auto_20399 ) ( IN ?auto_20395 ?auto_20400 ) ( not ( = ?auto_20394 ?auto_20395 ) ) ( not ( = ?auto_20396 ?auto_20395 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20394 ?auto_20396 ?auto_20393 )
      ( FLY-3PPL-VERIFY ?auto_20394 ?auto_20395 ?auto_20396 ?auto_20393 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20402 - PERSON
      ?auto_20403 - PERSON
      ?auto_20404 - PERSON
      ?auto_20401 - CITY
    )
    :vars
    (
      ?auto_20407 - FLEVEL
      ?auto_20406 - FLEVEL
      ?auto_20405 - CITY
      ?auto_20409 - AIRCRAFT
      ?auto_20408 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_20407 ?auto_20406 ) ( not ( = ?auto_20401 ?auto_20405 ) ) ( not ( = ?auto_20406 ?auto_20407 ) ) ( PERSON-AT ?auto_20404 ?auto_20401 ) ( not ( = ?auto_20404 ?auto_20403 ) ) ( PERSON-AT ?auto_20403 ?auto_20405 ) ( AIRCRAFT-AT ?auto_20409 ?auto_20401 ) ( FUEL-LEVEL ?auto_20409 ?auto_20407 ) ( IN ?auto_20408 ?auto_20409 ) ( not ( = ?auto_20404 ?auto_20408 ) ) ( not ( = ?auto_20403 ?auto_20408 ) ) ( PERSON-AT ?auto_20402 ?auto_20401 ) ( not ( = ?auto_20402 ?auto_20403 ) ) ( not ( = ?auto_20402 ?auto_20404 ) ) ( not ( = ?auto_20402 ?auto_20408 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20404 ?auto_20403 ?auto_20401 )
      ( FLY-3PPL-VERIFY ?auto_20402 ?auto_20403 ?auto_20404 ?auto_20401 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20411 - PERSON
      ?auto_20412 - PERSON
      ?auto_20413 - PERSON
      ?auto_20410 - CITY
    )
    :vars
    (
      ?auto_20416 - FLEVEL
      ?auto_20415 - FLEVEL
      ?auto_20414 - CITY
      ?auto_20417 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20416 ?auto_20415 ) ( not ( = ?auto_20410 ?auto_20414 ) ) ( not ( = ?auto_20415 ?auto_20416 ) ) ( PERSON-AT ?auto_20411 ?auto_20410 ) ( not ( = ?auto_20411 ?auto_20412 ) ) ( PERSON-AT ?auto_20412 ?auto_20414 ) ( AIRCRAFT-AT ?auto_20417 ?auto_20410 ) ( FUEL-LEVEL ?auto_20417 ?auto_20416 ) ( IN ?auto_20413 ?auto_20417 ) ( not ( = ?auto_20411 ?auto_20413 ) ) ( not ( = ?auto_20412 ?auto_20413 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20411 ?auto_20412 ?auto_20410 )
      ( FLY-3PPL-VERIFY ?auto_20411 ?auto_20412 ?auto_20413 ?auto_20410 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20428 - PERSON
      ?auto_20429 - PERSON
      ?auto_20430 - PERSON
      ?auto_20427 - CITY
    )
    :vars
    (
      ?auto_20433 - FLEVEL
      ?auto_20432 - FLEVEL
      ?auto_20431 - CITY
      ?auto_20434 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20433 ?auto_20432 ) ( not ( = ?auto_20427 ?auto_20431 ) ) ( not ( = ?auto_20432 ?auto_20433 ) ) ( PERSON-AT ?auto_20429 ?auto_20427 ) ( not ( = ?auto_20429 ?auto_20430 ) ) ( PERSON-AT ?auto_20430 ?auto_20431 ) ( AIRCRAFT-AT ?auto_20434 ?auto_20427 ) ( FUEL-LEVEL ?auto_20434 ?auto_20433 ) ( IN ?auto_20428 ?auto_20434 ) ( not ( = ?auto_20429 ?auto_20428 ) ) ( not ( = ?auto_20430 ?auto_20428 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20429 ?auto_20430 ?auto_20427 )
      ( FLY-3PPL-VERIFY ?auto_20428 ?auto_20429 ?auto_20430 ?auto_20427 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20445 - PERSON
      ?auto_20446 - PERSON
      ?auto_20447 - PERSON
      ?auto_20444 - CITY
    )
    :vars
    (
      ?auto_20450 - FLEVEL
      ?auto_20449 - FLEVEL
      ?auto_20448 - CITY
      ?auto_20451 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20450 ?auto_20449 ) ( not ( = ?auto_20444 ?auto_20448 ) ) ( not ( = ?auto_20449 ?auto_20450 ) ) ( PERSON-AT ?auto_20447 ?auto_20444 ) ( not ( = ?auto_20447 ?auto_20446 ) ) ( PERSON-AT ?auto_20446 ?auto_20448 ) ( AIRCRAFT-AT ?auto_20451 ?auto_20444 ) ( FUEL-LEVEL ?auto_20451 ?auto_20450 ) ( IN ?auto_20445 ?auto_20451 ) ( not ( = ?auto_20447 ?auto_20445 ) ) ( not ( = ?auto_20446 ?auto_20445 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20447 ?auto_20446 ?auto_20444 )
      ( FLY-3PPL-VERIFY ?auto_20445 ?auto_20446 ?auto_20447 ?auto_20444 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20471 - PERSON
      ?auto_20472 - PERSON
      ?auto_20473 - PERSON
      ?auto_20470 - CITY
    )
    :vars
    (
      ?auto_20476 - FLEVEL
      ?auto_20475 - FLEVEL
      ?auto_20474 - CITY
      ?auto_20478 - AIRCRAFT
      ?auto_20477 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_20476 ?auto_20475 ) ( not ( = ?auto_20470 ?auto_20474 ) ) ( not ( = ?auto_20475 ?auto_20476 ) ) ( PERSON-AT ?auto_20472 ?auto_20470 ) ( not ( = ?auto_20472 ?auto_20471 ) ) ( PERSON-AT ?auto_20471 ?auto_20474 ) ( AIRCRAFT-AT ?auto_20478 ?auto_20470 ) ( FUEL-LEVEL ?auto_20478 ?auto_20476 ) ( IN ?auto_20477 ?auto_20478 ) ( not ( = ?auto_20472 ?auto_20477 ) ) ( not ( = ?auto_20471 ?auto_20477 ) ) ( PERSON-AT ?auto_20473 ?auto_20470 ) ( not ( = ?auto_20471 ?auto_20473 ) ) ( not ( = ?auto_20472 ?auto_20473 ) ) ( not ( = ?auto_20473 ?auto_20477 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20472 ?auto_20471 ?auto_20470 )
      ( FLY-3PPL-VERIFY ?auto_20471 ?auto_20472 ?auto_20473 ?auto_20470 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20480 - PERSON
      ?auto_20481 - PERSON
      ?auto_20482 - PERSON
      ?auto_20479 - CITY
    )
    :vars
    (
      ?auto_20485 - FLEVEL
      ?auto_20484 - FLEVEL
      ?auto_20483 - CITY
      ?auto_20486 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20485 ?auto_20484 ) ( not ( = ?auto_20479 ?auto_20483 ) ) ( not ( = ?auto_20484 ?auto_20485 ) ) ( PERSON-AT ?auto_20481 ?auto_20479 ) ( not ( = ?auto_20481 ?auto_20480 ) ) ( PERSON-AT ?auto_20480 ?auto_20483 ) ( AIRCRAFT-AT ?auto_20486 ?auto_20479 ) ( FUEL-LEVEL ?auto_20486 ?auto_20485 ) ( IN ?auto_20482 ?auto_20486 ) ( not ( = ?auto_20481 ?auto_20482 ) ) ( not ( = ?auto_20480 ?auto_20482 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20481 ?auto_20480 ?auto_20479 )
      ( FLY-3PPL-VERIFY ?auto_20480 ?auto_20481 ?auto_20482 ?auto_20479 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20497 - PERSON
      ?auto_20498 - PERSON
      ?auto_20499 - PERSON
      ?auto_20496 - CITY
    )
    :vars
    (
      ?auto_20502 - FLEVEL
      ?auto_20501 - FLEVEL
      ?auto_20500 - CITY
      ?auto_20503 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20502 ?auto_20501 ) ( not ( = ?auto_20496 ?auto_20500 ) ) ( not ( = ?auto_20501 ?auto_20502 ) ) ( PERSON-AT ?auto_20499 ?auto_20496 ) ( not ( = ?auto_20499 ?auto_20497 ) ) ( PERSON-AT ?auto_20497 ?auto_20500 ) ( AIRCRAFT-AT ?auto_20503 ?auto_20496 ) ( FUEL-LEVEL ?auto_20503 ?auto_20502 ) ( IN ?auto_20498 ?auto_20503 ) ( not ( = ?auto_20499 ?auto_20498 ) ) ( not ( = ?auto_20497 ?auto_20498 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20499 ?auto_20497 ?auto_20496 )
      ( FLY-3PPL-VERIFY ?auto_20497 ?auto_20498 ?auto_20499 ?auto_20496 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_20551 - PERSON
      ?auto_20550 - CITY
    )
    :vars
    (
      ?auto_20554 - FLEVEL
      ?auto_20553 - FLEVEL
      ?auto_20552 - CITY
      ?auto_20557 - PERSON
      ?auto_20555 - PERSON
      ?auto_20556 - AIRCRAFT
      ?auto_20558 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20554 ?auto_20553 ) ( not ( = ?auto_20550 ?auto_20552 ) ) ( not ( = ?auto_20553 ?auto_20554 ) ) ( PERSON-AT ?auto_20557 ?auto_20550 ) ( not ( = ?auto_20557 ?auto_20551 ) ) ( PERSON-AT ?auto_20551 ?auto_20552 ) ( IN ?auto_20555 ?auto_20556 ) ( not ( = ?auto_20557 ?auto_20555 ) ) ( not ( = ?auto_20551 ?auto_20555 ) ) ( AIRCRAFT-AT ?auto_20556 ?auto_20558 ) ( FUEL-LEVEL ?auto_20556 ?auto_20553 ) ( not ( = ?auto_20550 ?auto_20558 ) ) ( not ( = ?auto_20552 ?auto_20558 ) ) )
    :subtasks
    ( ( !FLY ?auto_20556 ?auto_20558 ?auto_20550 ?auto_20553 ?auto_20554 )
      ( FLY-2PPL ?auto_20557 ?auto_20551 ?auto_20550 )
      ( FLY-1PPL-VERIFY ?auto_20551 ?auto_20550 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20560 - PERSON
      ?auto_20561 - PERSON
      ?auto_20559 - CITY
    )
    :vars
    (
      ?auto_20566 - FLEVEL
      ?auto_20563 - FLEVEL
      ?auto_20565 - CITY
      ?auto_20562 - PERSON
      ?auto_20564 - AIRCRAFT
      ?auto_20567 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20566 ?auto_20563 ) ( not ( = ?auto_20559 ?auto_20565 ) ) ( not ( = ?auto_20563 ?auto_20566 ) ) ( PERSON-AT ?auto_20560 ?auto_20559 ) ( not ( = ?auto_20560 ?auto_20561 ) ) ( PERSON-AT ?auto_20561 ?auto_20565 ) ( IN ?auto_20562 ?auto_20564 ) ( not ( = ?auto_20560 ?auto_20562 ) ) ( not ( = ?auto_20561 ?auto_20562 ) ) ( AIRCRAFT-AT ?auto_20564 ?auto_20567 ) ( FUEL-LEVEL ?auto_20564 ?auto_20563 ) ( not ( = ?auto_20559 ?auto_20567 ) ) ( not ( = ?auto_20565 ?auto_20567 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_20561 ?auto_20559 )
      ( FLY-2PPL-VERIFY ?auto_20560 ?auto_20561 ?auto_20559 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20569 - PERSON
      ?auto_20570 - PERSON
      ?auto_20568 - CITY
    )
    :vars
    (
      ?auto_20576 - FLEVEL
      ?auto_20575 - FLEVEL
      ?auto_20572 - CITY
      ?auto_20574 - PERSON
      ?auto_20573 - AIRCRAFT
      ?auto_20571 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20576 ?auto_20575 ) ( not ( = ?auto_20568 ?auto_20572 ) ) ( not ( = ?auto_20575 ?auto_20576 ) ) ( PERSON-AT ?auto_20574 ?auto_20568 ) ( not ( = ?auto_20574 ?auto_20570 ) ) ( PERSON-AT ?auto_20570 ?auto_20572 ) ( IN ?auto_20569 ?auto_20573 ) ( not ( = ?auto_20574 ?auto_20569 ) ) ( not ( = ?auto_20570 ?auto_20569 ) ) ( AIRCRAFT-AT ?auto_20573 ?auto_20571 ) ( FUEL-LEVEL ?auto_20573 ?auto_20575 ) ( not ( = ?auto_20568 ?auto_20571 ) ) ( not ( = ?auto_20572 ?auto_20571 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20574 ?auto_20570 ?auto_20568 )
      ( FLY-2PPL-VERIFY ?auto_20569 ?auto_20570 ?auto_20568 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20578 - PERSON
      ?auto_20579 - PERSON
      ?auto_20577 - CITY
    )
    :vars
    (
      ?auto_20585 - FLEVEL
      ?auto_20583 - FLEVEL
      ?auto_20581 - CITY
      ?auto_20584 - PERSON
      ?auto_20582 - AIRCRAFT
      ?auto_20580 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20585 ?auto_20583 ) ( not ( = ?auto_20577 ?auto_20581 ) ) ( not ( = ?auto_20583 ?auto_20585 ) ) ( PERSON-AT ?auto_20579 ?auto_20577 ) ( not ( = ?auto_20579 ?auto_20578 ) ) ( PERSON-AT ?auto_20578 ?auto_20581 ) ( IN ?auto_20584 ?auto_20582 ) ( not ( = ?auto_20579 ?auto_20584 ) ) ( not ( = ?auto_20578 ?auto_20584 ) ) ( AIRCRAFT-AT ?auto_20582 ?auto_20580 ) ( FUEL-LEVEL ?auto_20582 ?auto_20583 ) ( not ( = ?auto_20577 ?auto_20580 ) ) ( not ( = ?auto_20581 ?auto_20580 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20579 ?auto_20578 ?auto_20577 )
      ( FLY-2PPL-VERIFY ?auto_20578 ?auto_20579 ?auto_20577 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20587 - PERSON
      ?auto_20588 - PERSON
      ?auto_20586 - CITY
    )
    :vars
    (
      ?auto_20594 - FLEVEL
      ?auto_20593 - FLEVEL
      ?auto_20590 - CITY
      ?auto_20592 - PERSON
      ?auto_20591 - AIRCRAFT
      ?auto_20589 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20594 ?auto_20593 ) ( not ( = ?auto_20586 ?auto_20590 ) ) ( not ( = ?auto_20593 ?auto_20594 ) ) ( PERSON-AT ?auto_20592 ?auto_20586 ) ( not ( = ?auto_20592 ?auto_20587 ) ) ( PERSON-AT ?auto_20587 ?auto_20590 ) ( IN ?auto_20588 ?auto_20591 ) ( not ( = ?auto_20592 ?auto_20588 ) ) ( not ( = ?auto_20587 ?auto_20588 ) ) ( AIRCRAFT-AT ?auto_20591 ?auto_20589 ) ( FUEL-LEVEL ?auto_20591 ?auto_20593 ) ( not ( = ?auto_20586 ?auto_20589 ) ) ( not ( = ?auto_20590 ?auto_20589 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20592 ?auto_20587 ?auto_20586 )
      ( FLY-2PPL-VERIFY ?auto_20587 ?auto_20588 ?auto_20586 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20606 - PERSON
      ?auto_20607 - PERSON
      ?auto_20608 - PERSON
      ?auto_20605 - CITY
    )
    :vars
    (
      ?auto_20614 - FLEVEL
      ?auto_20612 - FLEVEL
      ?auto_20610 - CITY
      ?auto_20613 - PERSON
      ?auto_20611 - AIRCRAFT
      ?auto_20609 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20614 ?auto_20612 ) ( not ( = ?auto_20605 ?auto_20610 ) ) ( not ( = ?auto_20612 ?auto_20614 ) ) ( PERSON-AT ?auto_20607 ?auto_20605 ) ( not ( = ?auto_20607 ?auto_20608 ) ) ( PERSON-AT ?auto_20608 ?auto_20610 ) ( IN ?auto_20613 ?auto_20611 ) ( not ( = ?auto_20607 ?auto_20613 ) ) ( not ( = ?auto_20608 ?auto_20613 ) ) ( AIRCRAFT-AT ?auto_20611 ?auto_20609 ) ( FUEL-LEVEL ?auto_20611 ?auto_20612 ) ( not ( = ?auto_20605 ?auto_20609 ) ) ( not ( = ?auto_20610 ?auto_20609 ) ) ( PERSON-AT ?auto_20606 ?auto_20605 ) ( not ( = ?auto_20606 ?auto_20607 ) ) ( not ( = ?auto_20606 ?auto_20608 ) ) ( not ( = ?auto_20606 ?auto_20613 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20607 ?auto_20608 ?auto_20605 )
      ( FLY-3PPL-VERIFY ?auto_20606 ?auto_20607 ?auto_20608 ?auto_20605 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20616 - PERSON
      ?auto_20617 - PERSON
      ?auto_20618 - PERSON
      ?auto_20615 - CITY
    )
    :vars
    (
      ?auto_20623 - FLEVEL
      ?auto_20622 - FLEVEL
      ?auto_20620 - CITY
      ?auto_20621 - AIRCRAFT
      ?auto_20619 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20623 ?auto_20622 ) ( not ( = ?auto_20615 ?auto_20620 ) ) ( not ( = ?auto_20622 ?auto_20623 ) ) ( PERSON-AT ?auto_20616 ?auto_20615 ) ( not ( = ?auto_20616 ?auto_20618 ) ) ( PERSON-AT ?auto_20618 ?auto_20620 ) ( IN ?auto_20617 ?auto_20621 ) ( not ( = ?auto_20616 ?auto_20617 ) ) ( not ( = ?auto_20618 ?auto_20617 ) ) ( AIRCRAFT-AT ?auto_20621 ?auto_20619 ) ( FUEL-LEVEL ?auto_20621 ?auto_20622 ) ( not ( = ?auto_20615 ?auto_20619 ) ) ( not ( = ?auto_20620 ?auto_20619 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20616 ?auto_20618 ?auto_20615 )
      ( FLY-3PPL-VERIFY ?auto_20616 ?auto_20617 ?auto_20618 ?auto_20615 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20625 - PERSON
      ?auto_20626 - PERSON
      ?auto_20627 - PERSON
      ?auto_20624 - CITY
    )
    :vars
    (
      ?auto_20633 - FLEVEL
      ?auto_20631 - FLEVEL
      ?auto_20629 - CITY
      ?auto_20632 - PERSON
      ?auto_20630 - AIRCRAFT
      ?auto_20628 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20633 ?auto_20631 ) ( not ( = ?auto_20624 ?auto_20629 ) ) ( not ( = ?auto_20631 ?auto_20633 ) ) ( PERSON-AT ?auto_20627 ?auto_20624 ) ( not ( = ?auto_20627 ?auto_20626 ) ) ( PERSON-AT ?auto_20626 ?auto_20629 ) ( IN ?auto_20632 ?auto_20630 ) ( not ( = ?auto_20627 ?auto_20632 ) ) ( not ( = ?auto_20626 ?auto_20632 ) ) ( AIRCRAFT-AT ?auto_20630 ?auto_20628 ) ( FUEL-LEVEL ?auto_20630 ?auto_20631 ) ( not ( = ?auto_20624 ?auto_20628 ) ) ( not ( = ?auto_20629 ?auto_20628 ) ) ( PERSON-AT ?auto_20625 ?auto_20624 ) ( not ( = ?auto_20625 ?auto_20626 ) ) ( not ( = ?auto_20625 ?auto_20627 ) ) ( not ( = ?auto_20625 ?auto_20632 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20627 ?auto_20626 ?auto_20624 )
      ( FLY-3PPL-VERIFY ?auto_20625 ?auto_20626 ?auto_20627 ?auto_20624 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20635 - PERSON
      ?auto_20636 - PERSON
      ?auto_20637 - PERSON
      ?auto_20634 - CITY
    )
    :vars
    (
      ?auto_20642 - FLEVEL
      ?auto_20641 - FLEVEL
      ?auto_20639 - CITY
      ?auto_20640 - AIRCRAFT
      ?auto_20638 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20642 ?auto_20641 ) ( not ( = ?auto_20634 ?auto_20639 ) ) ( not ( = ?auto_20641 ?auto_20642 ) ) ( PERSON-AT ?auto_20635 ?auto_20634 ) ( not ( = ?auto_20635 ?auto_20636 ) ) ( PERSON-AT ?auto_20636 ?auto_20639 ) ( IN ?auto_20637 ?auto_20640 ) ( not ( = ?auto_20635 ?auto_20637 ) ) ( not ( = ?auto_20636 ?auto_20637 ) ) ( AIRCRAFT-AT ?auto_20640 ?auto_20638 ) ( FUEL-LEVEL ?auto_20640 ?auto_20641 ) ( not ( = ?auto_20634 ?auto_20638 ) ) ( not ( = ?auto_20639 ?auto_20638 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20635 ?auto_20636 ?auto_20634 )
      ( FLY-3PPL-VERIFY ?auto_20635 ?auto_20636 ?auto_20637 ?auto_20634 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20654 - PERSON
      ?auto_20655 - PERSON
      ?auto_20656 - PERSON
      ?auto_20653 - CITY
    )
    :vars
    (
      ?auto_20661 - FLEVEL
      ?auto_20660 - FLEVEL
      ?auto_20658 - CITY
      ?auto_20659 - AIRCRAFT
      ?auto_20657 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20661 ?auto_20660 ) ( not ( = ?auto_20653 ?auto_20658 ) ) ( not ( = ?auto_20660 ?auto_20661 ) ) ( PERSON-AT ?auto_20655 ?auto_20653 ) ( not ( = ?auto_20655 ?auto_20656 ) ) ( PERSON-AT ?auto_20656 ?auto_20658 ) ( IN ?auto_20654 ?auto_20659 ) ( not ( = ?auto_20655 ?auto_20654 ) ) ( not ( = ?auto_20656 ?auto_20654 ) ) ( AIRCRAFT-AT ?auto_20659 ?auto_20657 ) ( FUEL-LEVEL ?auto_20659 ?auto_20660 ) ( not ( = ?auto_20653 ?auto_20657 ) ) ( not ( = ?auto_20658 ?auto_20657 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20655 ?auto_20656 ?auto_20653 )
      ( FLY-3PPL-VERIFY ?auto_20654 ?auto_20655 ?auto_20656 ?auto_20653 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20673 - PERSON
      ?auto_20674 - PERSON
      ?auto_20675 - PERSON
      ?auto_20672 - CITY
    )
    :vars
    (
      ?auto_20680 - FLEVEL
      ?auto_20679 - FLEVEL
      ?auto_20677 - CITY
      ?auto_20678 - AIRCRAFT
      ?auto_20676 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20680 ?auto_20679 ) ( not ( = ?auto_20672 ?auto_20677 ) ) ( not ( = ?auto_20679 ?auto_20680 ) ) ( PERSON-AT ?auto_20675 ?auto_20672 ) ( not ( = ?auto_20675 ?auto_20674 ) ) ( PERSON-AT ?auto_20674 ?auto_20677 ) ( IN ?auto_20673 ?auto_20678 ) ( not ( = ?auto_20675 ?auto_20673 ) ) ( not ( = ?auto_20674 ?auto_20673 ) ) ( AIRCRAFT-AT ?auto_20678 ?auto_20676 ) ( FUEL-LEVEL ?auto_20678 ?auto_20679 ) ( not ( = ?auto_20672 ?auto_20676 ) ) ( not ( = ?auto_20677 ?auto_20676 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20675 ?auto_20674 ?auto_20672 )
      ( FLY-3PPL-VERIFY ?auto_20673 ?auto_20674 ?auto_20675 ?auto_20672 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20702 - PERSON
      ?auto_20703 - PERSON
      ?auto_20704 - PERSON
      ?auto_20701 - CITY
    )
    :vars
    (
      ?auto_20710 - FLEVEL
      ?auto_20708 - FLEVEL
      ?auto_20706 - CITY
      ?auto_20709 - PERSON
      ?auto_20707 - AIRCRAFT
      ?auto_20705 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20710 ?auto_20708 ) ( not ( = ?auto_20701 ?auto_20706 ) ) ( not ( = ?auto_20708 ?auto_20710 ) ) ( PERSON-AT ?auto_20704 ?auto_20701 ) ( not ( = ?auto_20704 ?auto_20702 ) ) ( PERSON-AT ?auto_20702 ?auto_20706 ) ( IN ?auto_20709 ?auto_20707 ) ( not ( = ?auto_20704 ?auto_20709 ) ) ( not ( = ?auto_20702 ?auto_20709 ) ) ( AIRCRAFT-AT ?auto_20707 ?auto_20705 ) ( FUEL-LEVEL ?auto_20707 ?auto_20708 ) ( not ( = ?auto_20701 ?auto_20705 ) ) ( not ( = ?auto_20706 ?auto_20705 ) ) ( PERSON-AT ?auto_20703 ?auto_20701 ) ( not ( = ?auto_20702 ?auto_20703 ) ) ( not ( = ?auto_20703 ?auto_20704 ) ) ( not ( = ?auto_20703 ?auto_20709 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20704 ?auto_20702 ?auto_20701 )
      ( FLY-3PPL-VERIFY ?auto_20702 ?auto_20703 ?auto_20704 ?auto_20701 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20712 - PERSON
      ?auto_20713 - PERSON
      ?auto_20714 - PERSON
      ?auto_20711 - CITY
    )
    :vars
    (
      ?auto_20719 - FLEVEL
      ?auto_20718 - FLEVEL
      ?auto_20716 - CITY
      ?auto_20717 - AIRCRAFT
      ?auto_20715 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20719 ?auto_20718 ) ( not ( = ?auto_20711 ?auto_20716 ) ) ( not ( = ?auto_20718 ?auto_20719 ) ) ( PERSON-AT ?auto_20713 ?auto_20711 ) ( not ( = ?auto_20713 ?auto_20712 ) ) ( PERSON-AT ?auto_20712 ?auto_20716 ) ( IN ?auto_20714 ?auto_20717 ) ( not ( = ?auto_20713 ?auto_20714 ) ) ( not ( = ?auto_20712 ?auto_20714 ) ) ( AIRCRAFT-AT ?auto_20717 ?auto_20715 ) ( FUEL-LEVEL ?auto_20717 ?auto_20718 ) ( not ( = ?auto_20711 ?auto_20715 ) ) ( not ( = ?auto_20716 ?auto_20715 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20713 ?auto_20712 ?auto_20711 )
      ( FLY-3PPL-VERIFY ?auto_20712 ?auto_20713 ?auto_20714 ?auto_20711 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20731 - PERSON
      ?auto_20732 - PERSON
      ?auto_20733 - PERSON
      ?auto_20730 - CITY
    )
    :vars
    (
      ?auto_20738 - FLEVEL
      ?auto_20737 - FLEVEL
      ?auto_20735 - CITY
      ?auto_20736 - AIRCRAFT
      ?auto_20734 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20738 ?auto_20737 ) ( not ( = ?auto_20730 ?auto_20735 ) ) ( not ( = ?auto_20737 ?auto_20738 ) ) ( PERSON-AT ?auto_20733 ?auto_20730 ) ( not ( = ?auto_20733 ?auto_20731 ) ) ( PERSON-AT ?auto_20731 ?auto_20735 ) ( IN ?auto_20732 ?auto_20736 ) ( not ( = ?auto_20733 ?auto_20732 ) ) ( not ( = ?auto_20731 ?auto_20732 ) ) ( AIRCRAFT-AT ?auto_20736 ?auto_20734 ) ( FUEL-LEVEL ?auto_20736 ?auto_20737 ) ( not ( = ?auto_20730 ?auto_20734 ) ) ( not ( = ?auto_20735 ?auto_20734 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20733 ?auto_20731 ?auto_20730 )
      ( FLY-3PPL-VERIFY ?auto_20731 ?auto_20732 ?auto_20733 ?auto_20730 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_20791 - PERSON
      ?auto_20790 - CITY
    )
    :vars
    (
      ?auto_20798 - FLEVEL
      ?auto_20796 - FLEVEL
      ?auto_20793 - CITY
      ?auto_20795 - PERSON
      ?auto_20797 - PERSON
      ?auto_20794 - AIRCRAFT
      ?auto_20792 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20798 ?auto_20796 ) ( not ( = ?auto_20790 ?auto_20793 ) ) ( not ( = ?auto_20796 ?auto_20798 ) ) ( PERSON-AT ?auto_20795 ?auto_20790 ) ( not ( = ?auto_20795 ?auto_20791 ) ) ( PERSON-AT ?auto_20791 ?auto_20793 ) ( not ( = ?auto_20795 ?auto_20797 ) ) ( not ( = ?auto_20791 ?auto_20797 ) ) ( AIRCRAFT-AT ?auto_20794 ?auto_20792 ) ( FUEL-LEVEL ?auto_20794 ?auto_20796 ) ( not ( = ?auto_20790 ?auto_20792 ) ) ( not ( = ?auto_20793 ?auto_20792 ) ) ( PERSON-AT ?auto_20797 ?auto_20792 ) )
    :subtasks
    ( ( !BOARD ?auto_20797 ?auto_20794 ?auto_20792 )
      ( FLY-2PPL ?auto_20795 ?auto_20791 ?auto_20790 )
      ( FLY-1PPL-VERIFY ?auto_20791 ?auto_20790 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20800 - PERSON
      ?auto_20801 - PERSON
      ?auto_20799 - CITY
    )
    :vars
    (
      ?auto_20805 - FLEVEL
      ?auto_20807 - FLEVEL
      ?auto_20806 - CITY
      ?auto_20802 - PERSON
      ?auto_20804 - AIRCRAFT
      ?auto_20803 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20805 ?auto_20807 ) ( not ( = ?auto_20799 ?auto_20806 ) ) ( not ( = ?auto_20807 ?auto_20805 ) ) ( PERSON-AT ?auto_20800 ?auto_20799 ) ( not ( = ?auto_20800 ?auto_20801 ) ) ( PERSON-AT ?auto_20801 ?auto_20806 ) ( not ( = ?auto_20800 ?auto_20802 ) ) ( not ( = ?auto_20801 ?auto_20802 ) ) ( AIRCRAFT-AT ?auto_20804 ?auto_20803 ) ( FUEL-LEVEL ?auto_20804 ?auto_20807 ) ( not ( = ?auto_20799 ?auto_20803 ) ) ( not ( = ?auto_20806 ?auto_20803 ) ) ( PERSON-AT ?auto_20802 ?auto_20803 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_20801 ?auto_20799 )
      ( FLY-2PPL-VERIFY ?auto_20800 ?auto_20801 ?auto_20799 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20809 - PERSON
      ?auto_20810 - PERSON
      ?auto_20808 - CITY
    )
    :vars
    (
      ?auto_20813 - FLEVEL
      ?auto_20812 - FLEVEL
      ?auto_20811 - CITY
      ?auto_20815 - PERSON
      ?auto_20814 - AIRCRAFT
      ?auto_20816 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20813 ?auto_20812 ) ( not ( = ?auto_20808 ?auto_20811 ) ) ( not ( = ?auto_20812 ?auto_20813 ) ) ( PERSON-AT ?auto_20815 ?auto_20808 ) ( not ( = ?auto_20815 ?auto_20810 ) ) ( PERSON-AT ?auto_20810 ?auto_20811 ) ( not ( = ?auto_20815 ?auto_20809 ) ) ( not ( = ?auto_20810 ?auto_20809 ) ) ( AIRCRAFT-AT ?auto_20814 ?auto_20816 ) ( FUEL-LEVEL ?auto_20814 ?auto_20812 ) ( not ( = ?auto_20808 ?auto_20816 ) ) ( not ( = ?auto_20811 ?auto_20816 ) ) ( PERSON-AT ?auto_20809 ?auto_20816 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20815 ?auto_20810 ?auto_20808 )
      ( FLY-2PPL-VERIFY ?auto_20809 ?auto_20810 ?auto_20808 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20818 - PERSON
      ?auto_20819 - PERSON
      ?auto_20817 - CITY
    )
    :vars
    (
      ?auto_20822 - FLEVEL
      ?auto_20821 - FLEVEL
      ?auto_20820 - CITY
      ?auto_20825 - PERSON
      ?auto_20823 - AIRCRAFT
      ?auto_20824 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20822 ?auto_20821 ) ( not ( = ?auto_20817 ?auto_20820 ) ) ( not ( = ?auto_20821 ?auto_20822 ) ) ( PERSON-AT ?auto_20819 ?auto_20817 ) ( not ( = ?auto_20819 ?auto_20818 ) ) ( PERSON-AT ?auto_20818 ?auto_20820 ) ( not ( = ?auto_20819 ?auto_20825 ) ) ( not ( = ?auto_20818 ?auto_20825 ) ) ( AIRCRAFT-AT ?auto_20823 ?auto_20824 ) ( FUEL-LEVEL ?auto_20823 ?auto_20821 ) ( not ( = ?auto_20817 ?auto_20824 ) ) ( not ( = ?auto_20820 ?auto_20824 ) ) ( PERSON-AT ?auto_20825 ?auto_20824 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20819 ?auto_20818 ?auto_20817 )
      ( FLY-2PPL-VERIFY ?auto_20818 ?auto_20819 ?auto_20817 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20827 - PERSON
      ?auto_20828 - PERSON
      ?auto_20826 - CITY
    )
    :vars
    (
      ?auto_20831 - FLEVEL
      ?auto_20830 - FLEVEL
      ?auto_20829 - CITY
      ?auto_20833 - PERSON
      ?auto_20832 - AIRCRAFT
      ?auto_20834 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20831 ?auto_20830 ) ( not ( = ?auto_20826 ?auto_20829 ) ) ( not ( = ?auto_20830 ?auto_20831 ) ) ( PERSON-AT ?auto_20833 ?auto_20826 ) ( not ( = ?auto_20833 ?auto_20827 ) ) ( PERSON-AT ?auto_20827 ?auto_20829 ) ( not ( = ?auto_20833 ?auto_20828 ) ) ( not ( = ?auto_20827 ?auto_20828 ) ) ( AIRCRAFT-AT ?auto_20832 ?auto_20834 ) ( FUEL-LEVEL ?auto_20832 ?auto_20830 ) ( not ( = ?auto_20826 ?auto_20834 ) ) ( not ( = ?auto_20829 ?auto_20834 ) ) ( PERSON-AT ?auto_20828 ?auto_20834 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20833 ?auto_20827 ?auto_20826 )
      ( FLY-2PPL-VERIFY ?auto_20827 ?auto_20828 ?auto_20826 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20846 - PERSON
      ?auto_20847 - PERSON
      ?auto_20848 - PERSON
      ?auto_20845 - CITY
    )
    :vars
    (
      ?auto_20851 - FLEVEL
      ?auto_20850 - FLEVEL
      ?auto_20849 - CITY
      ?auto_20854 - PERSON
      ?auto_20852 - AIRCRAFT
      ?auto_20853 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20851 ?auto_20850 ) ( not ( = ?auto_20845 ?auto_20849 ) ) ( not ( = ?auto_20850 ?auto_20851 ) ) ( PERSON-AT ?auto_20846 ?auto_20845 ) ( not ( = ?auto_20846 ?auto_20848 ) ) ( PERSON-AT ?auto_20848 ?auto_20849 ) ( not ( = ?auto_20846 ?auto_20854 ) ) ( not ( = ?auto_20848 ?auto_20854 ) ) ( AIRCRAFT-AT ?auto_20852 ?auto_20853 ) ( FUEL-LEVEL ?auto_20852 ?auto_20850 ) ( not ( = ?auto_20845 ?auto_20853 ) ) ( not ( = ?auto_20849 ?auto_20853 ) ) ( PERSON-AT ?auto_20854 ?auto_20853 ) ( PERSON-AT ?auto_20847 ?auto_20845 ) ( not ( = ?auto_20846 ?auto_20847 ) ) ( not ( = ?auto_20847 ?auto_20848 ) ) ( not ( = ?auto_20847 ?auto_20854 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20846 ?auto_20848 ?auto_20845 )
      ( FLY-3PPL-VERIFY ?auto_20846 ?auto_20847 ?auto_20848 ?auto_20845 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20856 - PERSON
      ?auto_20857 - PERSON
      ?auto_20858 - PERSON
      ?auto_20855 - CITY
    )
    :vars
    (
      ?auto_20861 - FLEVEL
      ?auto_20860 - FLEVEL
      ?auto_20859 - CITY
      ?auto_20862 - AIRCRAFT
      ?auto_20863 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20861 ?auto_20860 ) ( not ( = ?auto_20855 ?auto_20859 ) ) ( not ( = ?auto_20860 ?auto_20861 ) ) ( PERSON-AT ?auto_20856 ?auto_20855 ) ( not ( = ?auto_20856 ?auto_20858 ) ) ( PERSON-AT ?auto_20858 ?auto_20859 ) ( not ( = ?auto_20856 ?auto_20857 ) ) ( not ( = ?auto_20858 ?auto_20857 ) ) ( AIRCRAFT-AT ?auto_20862 ?auto_20863 ) ( FUEL-LEVEL ?auto_20862 ?auto_20860 ) ( not ( = ?auto_20855 ?auto_20863 ) ) ( not ( = ?auto_20859 ?auto_20863 ) ) ( PERSON-AT ?auto_20857 ?auto_20863 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20856 ?auto_20858 ?auto_20855 )
      ( FLY-3PPL-VERIFY ?auto_20856 ?auto_20857 ?auto_20858 ?auto_20855 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20865 - PERSON
      ?auto_20866 - PERSON
      ?auto_20867 - PERSON
      ?auto_20864 - CITY
    )
    :vars
    (
      ?auto_20870 - FLEVEL
      ?auto_20869 - FLEVEL
      ?auto_20868 - CITY
      ?auto_20873 - PERSON
      ?auto_20871 - AIRCRAFT
      ?auto_20872 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20870 ?auto_20869 ) ( not ( = ?auto_20864 ?auto_20868 ) ) ( not ( = ?auto_20869 ?auto_20870 ) ) ( PERSON-AT ?auto_20867 ?auto_20864 ) ( not ( = ?auto_20867 ?auto_20866 ) ) ( PERSON-AT ?auto_20866 ?auto_20868 ) ( not ( = ?auto_20867 ?auto_20873 ) ) ( not ( = ?auto_20866 ?auto_20873 ) ) ( AIRCRAFT-AT ?auto_20871 ?auto_20872 ) ( FUEL-LEVEL ?auto_20871 ?auto_20869 ) ( not ( = ?auto_20864 ?auto_20872 ) ) ( not ( = ?auto_20868 ?auto_20872 ) ) ( PERSON-AT ?auto_20873 ?auto_20872 ) ( PERSON-AT ?auto_20865 ?auto_20864 ) ( not ( = ?auto_20865 ?auto_20866 ) ) ( not ( = ?auto_20865 ?auto_20867 ) ) ( not ( = ?auto_20865 ?auto_20873 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20867 ?auto_20866 ?auto_20864 )
      ( FLY-3PPL-VERIFY ?auto_20865 ?auto_20866 ?auto_20867 ?auto_20864 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20875 - PERSON
      ?auto_20876 - PERSON
      ?auto_20877 - PERSON
      ?auto_20874 - CITY
    )
    :vars
    (
      ?auto_20880 - FLEVEL
      ?auto_20879 - FLEVEL
      ?auto_20878 - CITY
      ?auto_20881 - AIRCRAFT
      ?auto_20882 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20880 ?auto_20879 ) ( not ( = ?auto_20874 ?auto_20878 ) ) ( not ( = ?auto_20879 ?auto_20880 ) ) ( PERSON-AT ?auto_20875 ?auto_20874 ) ( not ( = ?auto_20875 ?auto_20876 ) ) ( PERSON-AT ?auto_20876 ?auto_20878 ) ( not ( = ?auto_20875 ?auto_20877 ) ) ( not ( = ?auto_20876 ?auto_20877 ) ) ( AIRCRAFT-AT ?auto_20881 ?auto_20882 ) ( FUEL-LEVEL ?auto_20881 ?auto_20879 ) ( not ( = ?auto_20874 ?auto_20882 ) ) ( not ( = ?auto_20878 ?auto_20882 ) ) ( PERSON-AT ?auto_20877 ?auto_20882 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20875 ?auto_20876 ?auto_20874 )
      ( FLY-3PPL-VERIFY ?auto_20875 ?auto_20876 ?auto_20877 ?auto_20874 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20894 - PERSON
      ?auto_20895 - PERSON
      ?auto_20896 - PERSON
      ?auto_20893 - CITY
    )
    :vars
    (
      ?auto_20899 - FLEVEL
      ?auto_20898 - FLEVEL
      ?auto_20897 - CITY
      ?auto_20900 - AIRCRAFT
      ?auto_20901 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20899 ?auto_20898 ) ( not ( = ?auto_20893 ?auto_20897 ) ) ( not ( = ?auto_20898 ?auto_20899 ) ) ( PERSON-AT ?auto_20895 ?auto_20893 ) ( not ( = ?auto_20895 ?auto_20896 ) ) ( PERSON-AT ?auto_20896 ?auto_20897 ) ( not ( = ?auto_20895 ?auto_20894 ) ) ( not ( = ?auto_20896 ?auto_20894 ) ) ( AIRCRAFT-AT ?auto_20900 ?auto_20901 ) ( FUEL-LEVEL ?auto_20900 ?auto_20898 ) ( not ( = ?auto_20893 ?auto_20901 ) ) ( not ( = ?auto_20897 ?auto_20901 ) ) ( PERSON-AT ?auto_20894 ?auto_20901 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20895 ?auto_20896 ?auto_20893 )
      ( FLY-3PPL-VERIFY ?auto_20894 ?auto_20895 ?auto_20896 ?auto_20893 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20913 - PERSON
      ?auto_20914 - PERSON
      ?auto_20915 - PERSON
      ?auto_20912 - CITY
    )
    :vars
    (
      ?auto_20918 - FLEVEL
      ?auto_20917 - FLEVEL
      ?auto_20916 - CITY
      ?auto_20919 - AIRCRAFT
      ?auto_20920 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20918 ?auto_20917 ) ( not ( = ?auto_20912 ?auto_20916 ) ) ( not ( = ?auto_20917 ?auto_20918 ) ) ( PERSON-AT ?auto_20915 ?auto_20912 ) ( not ( = ?auto_20915 ?auto_20914 ) ) ( PERSON-AT ?auto_20914 ?auto_20916 ) ( not ( = ?auto_20915 ?auto_20913 ) ) ( not ( = ?auto_20914 ?auto_20913 ) ) ( AIRCRAFT-AT ?auto_20919 ?auto_20920 ) ( FUEL-LEVEL ?auto_20919 ?auto_20917 ) ( not ( = ?auto_20912 ?auto_20920 ) ) ( not ( = ?auto_20916 ?auto_20920 ) ) ( PERSON-AT ?auto_20913 ?auto_20920 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20915 ?auto_20914 ?auto_20912 )
      ( FLY-3PPL-VERIFY ?auto_20913 ?auto_20914 ?auto_20915 ?auto_20912 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20942 - PERSON
      ?auto_20943 - PERSON
      ?auto_20944 - PERSON
      ?auto_20941 - CITY
    )
    :vars
    (
      ?auto_20947 - FLEVEL
      ?auto_20946 - FLEVEL
      ?auto_20945 - CITY
      ?auto_20950 - PERSON
      ?auto_20948 - AIRCRAFT
      ?auto_20949 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20947 ?auto_20946 ) ( not ( = ?auto_20941 ?auto_20945 ) ) ( not ( = ?auto_20946 ?auto_20947 ) ) ( PERSON-AT ?auto_20944 ?auto_20941 ) ( not ( = ?auto_20944 ?auto_20942 ) ) ( PERSON-AT ?auto_20942 ?auto_20945 ) ( not ( = ?auto_20944 ?auto_20950 ) ) ( not ( = ?auto_20942 ?auto_20950 ) ) ( AIRCRAFT-AT ?auto_20948 ?auto_20949 ) ( FUEL-LEVEL ?auto_20948 ?auto_20946 ) ( not ( = ?auto_20941 ?auto_20949 ) ) ( not ( = ?auto_20945 ?auto_20949 ) ) ( PERSON-AT ?auto_20950 ?auto_20949 ) ( PERSON-AT ?auto_20943 ?auto_20941 ) ( not ( = ?auto_20942 ?auto_20943 ) ) ( not ( = ?auto_20943 ?auto_20944 ) ) ( not ( = ?auto_20943 ?auto_20950 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20944 ?auto_20942 ?auto_20941 )
      ( FLY-3PPL-VERIFY ?auto_20942 ?auto_20943 ?auto_20944 ?auto_20941 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20952 - PERSON
      ?auto_20953 - PERSON
      ?auto_20954 - PERSON
      ?auto_20951 - CITY
    )
    :vars
    (
      ?auto_20957 - FLEVEL
      ?auto_20956 - FLEVEL
      ?auto_20955 - CITY
      ?auto_20958 - AIRCRAFT
      ?auto_20959 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20957 ?auto_20956 ) ( not ( = ?auto_20951 ?auto_20955 ) ) ( not ( = ?auto_20956 ?auto_20957 ) ) ( PERSON-AT ?auto_20953 ?auto_20951 ) ( not ( = ?auto_20953 ?auto_20952 ) ) ( PERSON-AT ?auto_20952 ?auto_20955 ) ( not ( = ?auto_20953 ?auto_20954 ) ) ( not ( = ?auto_20952 ?auto_20954 ) ) ( AIRCRAFT-AT ?auto_20958 ?auto_20959 ) ( FUEL-LEVEL ?auto_20958 ?auto_20956 ) ( not ( = ?auto_20951 ?auto_20959 ) ) ( not ( = ?auto_20955 ?auto_20959 ) ) ( PERSON-AT ?auto_20954 ?auto_20959 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20953 ?auto_20952 ?auto_20951 )
      ( FLY-3PPL-VERIFY ?auto_20952 ?auto_20953 ?auto_20954 ?auto_20951 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20971 - PERSON
      ?auto_20972 - PERSON
      ?auto_20973 - PERSON
      ?auto_20970 - CITY
    )
    :vars
    (
      ?auto_20976 - FLEVEL
      ?auto_20975 - FLEVEL
      ?auto_20974 - CITY
      ?auto_20977 - AIRCRAFT
      ?auto_20978 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_20976 ?auto_20975 ) ( not ( = ?auto_20970 ?auto_20974 ) ) ( not ( = ?auto_20975 ?auto_20976 ) ) ( PERSON-AT ?auto_20973 ?auto_20970 ) ( not ( = ?auto_20973 ?auto_20971 ) ) ( PERSON-AT ?auto_20971 ?auto_20974 ) ( not ( = ?auto_20973 ?auto_20972 ) ) ( not ( = ?auto_20971 ?auto_20972 ) ) ( AIRCRAFT-AT ?auto_20977 ?auto_20978 ) ( FUEL-LEVEL ?auto_20977 ?auto_20975 ) ( not ( = ?auto_20970 ?auto_20978 ) ) ( not ( = ?auto_20974 ?auto_20978 ) ) ( PERSON-AT ?auto_20972 ?auto_20978 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20973 ?auto_20971 ?auto_20970 )
      ( FLY-3PPL-VERIFY ?auto_20971 ?auto_20972 ?auto_20973 ?auto_20970 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_21031 - PERSON
      ?auto_21030 - CITY
    )
    :vars
    (
      ?auto_21034 - FLEVEL
      ?auto_21033 - FLEVEL
      ?auto_21032 - CITY
      ?auto_21036 - PERSON
      ?auto_21038 - PERSON
      ?auto_21035 - AIRCRAFT
      ?auto_21037 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21034 ?auto_21033 ) ( not ( = ?auto_21030 ?auto_21032 ) ) ( not ( = ?auto_21033 ?auto_21034 ) ) ( PERSON-AT ?auto_21036 ?auto_21030 ) ( not ( = ?auto_21036 ?auto_21031 ) ) ( PERSON-AT ?auto_21031 ?auto_21032 ) ( not ( = ?auto_21036 ?auto_21038 ) ) ( not ( = ?auto_21031 ?auto_21038 ) ) ( AIRCRAFT-AT ?auto_21035 ?auto_21037 ) ( not ( = ?auto_21030 ?auto_21037 ) ) ( not ( = ?auto_21032 ?auto_21037 ) ) ( PERSON-AT ?auto_21038 ?auto_21037 ) ( FUEL-LEVEL ?auto_21035 ?auto_21034 ) )
    :subtasks
    ( ( !REFUEL ?auto_21035 ?auto_21037 ?auto_21034 ?auto_21033 )
      ( FLY-2PPL ?auto_21036 ?auto_21031 ?auto_21030 )
      ( FLY-1PPL-VERIFY ?auto_21031 ?auto_21030 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21040 - PERSON
      ?auto_21041 - PERSON
      ?auto_21039 - CITY
    )
    :vars
    (
      ?auto_21046 - FLEVEL
      ?auto_21045 - FLEVEL
      ?auto_21042 - CITY
      ?auto_21047 - PERSON
      ?auto_21044 - AIRCRAFT
      ?auto_21043 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21046 ?auto_21045 ) ( not ( = ?auto_21039 ?auto_21042 ) ) ( not ( = ?auto_21045 ?auto_21046 ) ) ( PERSON-AT ?auto_21040 ?auto_21039 ) ( not ( = ?auto_21040 ?auto_21041 ) ) ( PERSON-AT ?auto_21041 ?auto_21042 ) ( not ( = ?auto_21040 ?auto_21047 ) ) ( not ( = ?auto_21041 ?auto_21047 ) ) ( AIRCRAFT-AT ?auto_21044 ?auto_21043 ) ( not ( = ?auto_21039 ?auto_21043 ) ) ( not ( = ?auto_21042 ?auto_21043 ) ) ( PERSON-AT ?auto_21047 ?auto_21043 ) ( FUEL-LEVEL ?auto_21044 ?auto_21046 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_21041 ?auto_21039 )
      ( FLY-2PPL-VERIFY ?auto_21040 ?auto_21041 ?auto_21039 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21049 - PERSON
      ?auto_21050 - PERSON
      ?auto_21048 - CITY
    )
    :vars
    (
      ?auto_21052 - FLEVEL
      ?auto_21053 - FLEVEL
      ?auto_21056 - CITY
      ?auto_21051 - PERSON
      ?auto_21054 - AIRCRAFT
      ?auto_21055 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21052 ?auto_21053 ) ( not ( = ?auto_21048 ?auto_21056 ) ) ( not ( = ?auto_21053 ?auto_21052 ) ) ( PERSON-AT ?auto_21051 ?auto_21048 ) ( not ( = ?auto_21051 ?auto_21050 ) ) ( PERSON-AT ?auto_21050 ?auto_21056 ) ( not ( = ?auto_21051 ?auto_21049 ) ) ( not ( = ?auto_21050 ?auto_21049 ) ) ( AIRCRAFT-AT ?auto_21054 ?auto_21055 ) ( not ( = ?auto_21048 ?auto_21055 ) ) ( not ( = ?auto_21056 ?auto_21055 ) ) ( PERSON-AT ?auto_21049 ?auto_21055 ) ( FUEL-LEVEL ?auto_21054 ?auto_21052 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21051 ?auto_21050 ?auto_21048 )
      ( FLY-2PPL-VERIFY ?auto_21049 ?auto_21050 ?auto_21048 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21058 - PERSON
      ?auto_21059 - PERSON
      ?auto_21057 - CITY
    )
    :vars
    (
      ?auto_21061 - FLEVEL
      ?auto_21062 - FLEVEL
      ?auto_21065 - CITY
      ?auto_21060 - PERSON
      ?auto_21063 - AIRCRAFT
      ?auto_21064 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21061 ?auto_21062 ) ( not ( = ?auto_21057 ?auto_21065 ) ) ( not ( = ?auto_21062 ?auto_21061 ) ) ( PERSON-AT ?auto_21059 ?auto_21057 ) ( not ( = ?auto_21059 ?auto_21058 ) ) ( PERSON-AT ?auto_21058 ?auto_21065 ) ( not ( = ?auto_21059 ?auto_21060 ) ) ( not ( = ?auto_21058 ?auto_21060 ) ) ( AIRCRAFT-AT ?auto_21063 ?auto_21064 ) ( not ( = ?auto_21057 ?auto_21064 ) ) ( not ( = ?auto_21065 ?auto_21064 ) ) ( PERSON-AT ?auto_21060 ?auto_21064 ) ( FUEL-LEVEL ?auto_21063 ?auto_21061 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21059 ?auto_21058 ?auto_21057 )
      ( FLY-2PPL-VERIFY ?auto_21058 ?auto_21059 ?auto_21057 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21067 - PERSON
      ?auto_21068 - PERSON
      ?auto_21066 - CITY
    )
    :vars
    (
      ?auto_21070 - FLEVEL
      ?auto_21071 - FLEVEL
      ?auto_21074 - CITY
      ?auto_21069 - PERSON
      ?auto_21072 - AIRCRAFT
      ?auto_21073 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21070 ?auto_21071 ) ( not ( = ?auto_21066 ?auto_21074 ) ) ( not ( = ?auto_21071 ?auto_21070 ) ) ( PERSON-AT ?auto_21069 ?auto_21066 ) ( not ( = ?auto_21069 ?auto_21067 ) ) ( PERSON-AT ?auto_21067 ?auto_21074 ) ( not ( = ?auto_21069 ?auto_21068 ) ) ( not ( = ?auto_21067 ?auto_21068 ) ) ( AIRCRAFT-AT ?auto_21072 ?auto_21073 ) ( not ( = ?auto_21066 ?auto_21073 ) ) ( not ( = ?auto_21074 ?auto_21073 ) ) ( PERSON-AT ?auto_21068 ?auto_21073 ) ( FUEL-LEVEL ?auto_21072 ?auto_21070 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21069 ?auto_21067 ?auto_21066 )
      ( FLY-2PPL-VERIFY ?auto_21067 ?auto_21068 ?auto_21066 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21086 - PERSON
      ?auto_21087 - PERSON
      ?auto_21088 - PERSON
      ?auto_21085 - CITY
    )
    :vars
    (
      ?auto_21090 - FLEVEL
      ?auto_21091 - FLEVEL
      ?auto_21094 - CITY
      ?auto_21089 - PERSON
      ?auto_21092 - AIRCRAFT
      ?auto_21093 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21090 ?auto_21091 ) ( not ( = ?auto_21085 ?auto_21094 ) ) ( not ( = ?auto_21091 ?auto_21090 ) ) ( PERSON-AT ?auto_21087 ?auto_21085 ) ( not ( = ?auto_21087 ?auto_21088 ) ) ( PERSON-AT ?auto_21088 ?auto_21094 ) ( not ( = ?auto_21087 ?auto_21089 ) ) ( not ( = ?auto_21088 ?auto_21089 ) ) ( AIRCRAFT-AT ?auto_21092 ?auto_21093 ) ( not ( = ?auto_21085 ?auto_21093 ) ) ( not ( = ?auto_21094 ?auto_21093 ) ) ( PERSON-AT ?auto_21089 ?auto_21093 ) ( FUEL-LEVEL ?auto_21092 ?auto_21090 ) ( PERSON-AT ?auto_21086 ?auto_21085 ) ( not ( = ?auto_21086 ?auto_21087 ) ) ( not ( = ?auto_21086 ?auto_21088 ) ) ( not ( = ?auto_21086 ?auto_21089 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21087 ?auto_21088 ?auto_21085 )
      ( FLY-3PPL-VERIFY ?auto_21086 ?auto_21087 ?auto_21088 ?auto_21085 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21096 - PERSON
      ?auto_21097 - PERSON
      ?auto_21098 - PERSON
      ?auto_21095 - CITY
    )
    :vars
    (
      ?auto_21099 - FLEVEL
      ?auto_21100 - FLEVEL
      ?auto_21103 - CITY
      ?auto_21101 - AIRCRAFT
      ?auto_21102 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21099 ?auto_21100 ) ( not ( = ?auto_21095 ?auto_21103 ) ) ( not ( = ?auto_21100 ?auto_21099 ) ) ( PERSON-AT ?auto_21096 ?auto_21095 ) ( not ( = ?auto_21096 ?auto_21098 ) ) ( PERSON-AT ?auto_21098 ?auto_21103 ) ( not ( = ?auto_21096 ?auto_21097 ) ) ( not ( = ?auto_21098 ?auto_21097 ) ) ( AIRCRAFT-AT ?auto_21101 ?auto_21102 ) ( not ( = ?auto_21095 ?auto_21102 ) ) ( not ( = ?auto_21103 ?auto_21102 ) ) ( PERSON-AT ?auto_21097 ?auto_21102 ) ( FUEL-LEVEL ?auto_21101 ?auto_21099 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21096 ?auto_21098 ?auto_21095 )
      ( FLY-3PPL-VERIFY ?auto_21096 ?auto_21097 ?auto_21098 ?auto_21095 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21105 - PERSON
      ?auto_21106 - PERSON
      ?auto_21107 - PERSON
      ?auto_21104 - CITY
    )
    :vars
    (
      ?auto_21109 - FLEVEL
      ?auto_21110 - FLEVEL
      ?auto_21113 - CITY
      ?auto_21108 - PERSON
      ?auto_21111 - AIRCRAFT
      ?auto_21112 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21109 ?auto_21110 ) ( not ( = ?auto_21104 ?auto_21113 ) ) ( not ( = ?auto_21110 ?auto_21109 ) ) ( PERSON-AT ?auto_21107 ?auto_21104 ) ( not ( = ?auto_21107 ?auto_21106 ) ) ( PERSON-AT ?auto_21106 ?auto_21113 ) ( not ( = ?auto_21107 ?auto_21108 ) ) ( not ( = ?auto_21106 ?auto_21108 ) ) ( AIRCRAFT-AT ?auto_21111 ?auto_21112 ) ( not ( = ?auto_21104 ?auto_21112 ) ) ( not ( = ?auto_21113 ?auto_21112 ) ) ( PERSON-AT ?auto_21108 ?auto_21112 ) ( FUEL-LEVEL ?auto_21111 ?auto_21109 ) ( PERSON-AT ?auto_21105 ?auto_21104 ) ( not ( = ?auto_21105 ?auto_21106 ) ) ( not ( = ?auto_21105 ?auto_21107 ) ) ( not ( = ?auto_21105 ?auto_21108 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21107 ?auto_21106 ?auto_21104 )
      ( FLY-3PPL-VERIFY ?auto_21105 ?auto_21106 ?auto_21107 ?auto_21104 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21115 - PERSON
      ?auto_21116 - PERSON
      ?auto_21117 - PERSON
      ?auto_21114 - CITY
    )
    :vars
    (
      ?auto_21118 - FLEVEL
      ?auto_21119 - FLEVEL
      ?auto_21122 - CITY
      ?auto_21120 - AIRCRAFT
      ?auto_21121 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21118 ?auto_21119 ) ( not ( = ?auto_21114 ?auto_21122 ) ) ( not ( = ?auto_21119 ?auto_21118 ) ) ( PERSON-AT ?auto_21115 ?auto_21114 ) ( not ( = ?auto_21115 ?auto_21116 ) ) ( PERSON-AT ?auto_21116 ?auto_21122 ) ( not ( = ?auto_21115 ?auto_21117 ) ) ( not ( = ?auto_21116 ?auto_21117 ) ) ( AIRCRAFT-AT ?auto_21120 ?auto_21121 ) ( not ( = ?auto_21114 ?auto_21121 ) ) ( not ( = ?auto_21122 ?auto_21121 ) ) ( PERSON-AT ?auto_21117 ?auto_21121 ) ( FUEL-LEVEL ?auto_21120 ?auto_21118 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21115 ?auto_21116 ?auto_21114 )
      ( FLY-3PPL-VERIFY ?auto_21115 ?auto_21116 ?auto_21117 ?auto_21114 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21134 - PERSON
      ?auto_21135 - PERSON
      ?auto_21136 - PERSON
      ?auto_21133 - CITY
    )
    :vars
    (
      ?auto_21137 - FLEVEL
      ?auto_21138 - FLEVEL
      ?auto_21141 - CITY
      ?auto_21139 - AIRCRAFT
      ?auto_21140 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21137 ?auto_21138 ) ( not ( = ?auto_21133 ?auto_21141 ) ) ( not ( = ?auto_21138 ?auto_21137 ) ) ( PERSON-AT ?auto_21135 ?auto_21133 ) ( not ( = ?auto_21135 ?auto_21136 ) ) ( PERSON-AT ?auto_21136 ?auto_21141 ) ( not ( = ?auto_21135 ?auto_21134 ) ) ( not ( = ?auto_21136 ?auto_21134 ) ) ( AIRCRAFT-AT ?auto_21139 ?auto_21140 ) ( not ( = ?auto_21133 ?auto_21140 ) ) ( not ( = ?auto_21141 ?auto_21140 ) ) ( PERSON-AT ?auto_21134 ?auto_21140 ) ( FUEL-LEVEL ?auto_21139 ?auto_21137 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21135 ?auto_21136 ?auto_21133 )
      ( FLY-3PPL-VERIFY ?auto_21134 ?auto_21135 ?auto_21136 ?auto_21133 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21153 - PERSON
      ?auto_21154 - PERSON
      ?auto_21155 - PERSON
      ?auto_21152 - CITY
    )
    :vars
    (
      ?auto_21156 - FLEVEL
      ?auto_21157 - FLEVEL
      ?auto_21160 - CITY
      ?auto_21158 - AIRCRAFT
      ?auto_21159 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21156 ?auto_21157 ) ( not ( = ?auto_21152 ?auto_21160 ) ) ( not ( = ?auto_21157 ?auto_21156 ) ) ( PERSON-AT ?auto_21155 ?auto_21152 ) ( not ( = ?auto_21155 ?auto_21154 ) ) ( PERSON-AT ?auto_21154 ?auto_21160 ) ( not ( = ?auto_21155 ?auto_21153 ) ) ( not ( = ?auto_21154 ?auto_21153 ) ) ( AIRCRAFT-AT ?auto_21158 ?auto_21159 ) ( not ( = ?auto_21152 ?auto_21159 ) ) ( not ( = ?auto_21160 ?auto_21159 ) ) ( PERSON-AT ?auto_21153 ?auto_21159 ) ( FUEL-LEVEL ?auto_21158 ?auto_21156 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21155 ?auto_21154 ?auto_21152 )
      ( FLY-3PPL-VERIFY ?auto_21153 ?auto_21154 ?auto_21155 ?auto_21152 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21182 - PERSON
      ?auto_21183 - PERSON
      ?auto_21184 - PERSON
      ?auto_21181 - CITY
    )
    :vars
    (
      ?auto_21186 - FLEVEL
      ?auto_21187 - FLEVEL
      ?auto_21190 - CITY
      ?auto_21185 - PERSON
      ?auto_21188 - AIRCRAFT
      ?auto_21189 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21186 ?auto_21187 ) ( not ( = ?auto_21181 ?auto_21190 ) ) ( not ( = ?auto_21187 ?auto_21186 ) ) ( PERSON-AT ?auto_21183 ?auto_21181 ) ( not ( = ?auto_21183 ?auto_21182 ) ) ( PERSON-AT ?auto_21182 ?auto_21190 ) ( not ( = ?auto_21183 ?auto_21185 ) ) ( not ( = ?auto_21182 ?auto_21185 ) ) ( AIRCRAFT-AT ?auto_21188 ?auto_21189 ) ( not ( = ?auto_21181 ?auto_21189 ) ) ( not ( = ?auto_21190 ?auto_21189 ) ) ( PERSON-AT ?auto_21185 ?auto_21189 ) ( FUEL-LEVEL ?auto_21188 ?auto_21186 ) ( PERSON-AT ?auto_21184 ?auto_21181 ) ( not ( = ?auto_21182 ?auto_21184 ) ) ( not ( = ?auto_21183 ?auto_21184 ) ) ( not ( = ?auto_21184 ?auto_21185 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21183 ?auto_21182 ?auto_21181 )
      ( FLY-3PPL-VERIFY ?auto_21182 ?auto_21183 ?auto_21184 ?auto_21181 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21192 - PERSON
      ?auto_21193 - PERSON
      ?auto_21194 - PERSON
      ?auto_21191 - CITY
    )
    :vars
    (
      ?auto_21195 - FLEVEL
      ?auto_21196 - FLEVEL
      ?auto_21199 - CITY
      ?auto_21197 - AIRCRAFT
      ?auto_21198 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21195 ?auto_21196 ) ( not ( = ?auto_21191 ?auto_21199 ) ) ( not ( = ?auto_21196 ?auto_21195 ) ) ( PERSON-AT ?auto_21193 ?auto_21191 ) ( not ( = ?auto_21193 ?auto_21192 ) ) ( PERSON-AT ?auto_21192 ?auto_21199 ) ( not ( = ?auto_21193 ?auto_21194 ) ) ( not ( = ?auto_21192 ?auto_21194 ) ) ( AIRCRAFT-AT ?auto_21197 ?auto_21198 ) ( not ( = ?auto_21191 ?auto_21198 ) ) ( not ( = ?auto_21199 ?auto_21198 ) ) ( PERSON-AT ?auto_21194 ?auto_21198 ) ( FUEL-LEVEL ?auto_21197 ?auto_21195 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21193 ?auto_21192 ?auto_21191 )
      ( FLY-3PPL-VERIFY ?auto_21192 ?auto_21193 ?auto_21194 ?auto_21191 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21211 - PERSON
      ?auto_21212 - PERSON
      ?auto_21213 - PERSON
      ?auto_21210 - CITY
    )
    :vars
    (
      ?auto_21214 - FLEVEL
      ?auto_21215 - FLEVEL
      ?auto_21218 - CITY
      ?auto_21216 - AIRCRAFT
      ?auto_21217 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21214 ?auto_21215 ) ( not ( = ?auto_21210 ?auto_21218 ) ) ( not ( = ?auto_21215 ?auto_21214 ) ) ( PERSON-AT ?auto_21213 ?auto_21210 ) ( not ( = ?auto_21213 ?auto_21211 ) ) ( PERSON-AT ?auto_21211 ?auto_21218 ) ( not ( = ?auto_21213 ?auto_21212 ) ) ( not ( = ?auto_21211 ?auto_21212 ) ) ( AIRCRAFT-AT ?auto_21216 ?auto_21217 ) ( not ( = ?auto_21210 ?auto_21217 ) ) ( not ( = ?auto_21218 ?auto_21217 ) ) ( PERSON-AT ?auto_21212 ?auto_21217 ) ( FUEL-LEVEL ?auto_21216 ?auto_21214 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21213 ?auto_21211 ?auto_21210 )
      ( FLY-3PPL-VERIFY ?auto_21211 ?auto_21212 ?auto_21213 ?auto_21210 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_21271 - PERSON
      ?auto_21270 - CITY
    )
    :vars
    (
      ?auto_21274 - FLEVEL
      ?auto_21275 - FLEVEL
      ?auto_21278 - CITY
      ?auto_21273 - PERSON
      ?auto_21272 - PERSON
      ?auto_21277 - CITY
      ?auto_21276 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21274 ?auto_21275 ) ( not ( = ?auto_21270 ?auto_21278 ) ) ( not ( = ?auto_21275 ?auto_21274 ) ) ( PERSON-AT ?auto_21273 ?auto_21270 ) ( not ( = ?auto_21273 ?auto_21271 ) ) ( PERSON-AT ?auto_21271 ?auto_21278 ) ( not ( = ?auto_21273 ?auto_21272 ) ) ( not ( = ?auto_21271 ?auto_21272 ) ) ( not ( = ?auto_21270 ?auto_21277 ) ) ( not ( = ?auto_21278 ?auto_21277 ) ) ( PERSON-AT ?auto_21272 ?auto_21277 ) ( AIRCRAFT-AT ?auto_21276 ?auto_21270 ) ( FUEL-LEVEL ?auto_21276 ?auto_21275 ) )
    :subtasks
    ( ( !FLY ?auto_21276 ?auto_21270 ?auto_21277 ?auto_21275 ?auto_21274 )
      ( FLY-2PPL ?auto_21273 ?auto_21271 ?auto_21270 )
      ( FLY-1PPL-VERIFY ?auto_21271 ?auto_21270 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21280 - PERSON
      ?auto_21281 - PERSON
      ?auto_21279 - CITY
    )
    :vars
    (
      ?auto_21287 - FLEVEL
      ?auto_21284 - FLEVEL
      ?auto_21283 - CITY
      ?auto_21285 - PERSON
      ?auto_21286 - CITY
      ?auto_21282 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21287 ?auto_21284 ) ( not ( = ?auto_21279 ?auto_21283 ) ) ( not ( = ?auto_21284 ?auto_21287 ) ) ( PERSON-AT ?auto_21280 ?auto_21279 ) ( not ( = ?auto_21280 ?auto_21281 ) ) ( PERSON-AT ?auto_21281 ?auto_21283 ) ( not ( = ?auto_21280 ?auto_21285 ) ) ( not ( = ?auto_21281 ?auto_21285 ) ) ( not ( = ?auto_21279 ?auto_21286 ) ) ( not ( = ?auto_21283 ?auto_21286 ) ) ( PERSON-AT ?auto_21285 ?auto_21286 ) ( AIRCRAFT-AT ?auto_21282 ?auto_21279 ) ( FUEL-LEVEL ?auto_21282 ?auto_21284 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_21281 ?auto_21279 )
      ( FLY-2PPL-VERIFY ?auto_21280 ?auto_21281 ?auto_21279 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21289 - PERSON
      ?auto_21290 - PERSON
      ?auto_21288 - CITY
    )
    :vars
    (
      ?auto_21294 - FLEVEL
      ?auto_21293 - FLEVEL
      ?auto_21292 - CITY
      ?auto_21291 - PERSON
      ?auto_21296 - CITY
      ?auto_21295 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21294 ?auto_21293 ) ( not ( = ?auto_21288 ?auto_21292 ) ) ( not ( = ?auto_21293 ?auto_21294 ) ) ( PERSON-AT ?auto_21291 ?auto_21288 ) ( not ( = ?auto_21291 ?auto_21290 ) ) ( PERSON-AT ?auto_21290 ?auto_21292 ) ( not ( = ?auto_21291 ?auto_21289 ) ) ( not ( = ?auto_21290 ?auto_21289 ) ) ( not ( = ?auto_21288 ?auto_21296 ) ) ( not ( = ?auto_21292 ?auto_21296 ) ) ( PERSON-AT ?auto_21289 ?auto_21296 ) ( AIRCRAFT-AT ?auto_21295 ?auto_21288 ) ( FUEL-LEVEL ?auto_21295 ?auto_21293 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21291 ?auto_21290 ?auto_21288 )
      ( FLY-2PPL-VERIFY ?auto_21289 ?auto_21290 ?auto_21288 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21298 - PERSON
      ?auto_21299 - PERSON
      ?auto_21297 - CITY
    )
    :vars
    (
      ?auto_21303 - FLEVEL
      ?auto_21301 - FLEVEL
      ?auto_21300 - CITY
      ?auto_21302 - PERSON
      ?auto_21305 - CITY
      ?auto_21304 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21303 ?auto_21301 ) ( not ( = ?auto_21297 ?auto_21300 ) ) ( not ( = ?auto_21301 ?auto_21303 ) ) ( PERSON-AT ?auto_21299 ?auto_21297 ) ( not ( = ?auto_21299 ?auto_21298 ) ) ( PERSON-AT ?auto_21298 ?auto_21300 ) ( not ( = ?auto_21299 ?auto_21302 ) ) ( not ( = ?auto_21298 ?auto_21302 ) ) ( not ( = ?auto_21297 ?auto_21305 ) ) ( not ( = ?auto_21300 ?auto_21305 ) ) ( PERSON-AT ?auto_21302 ?auto_21305 ) ( AIRCRAFT-AT ?auto_21304 ?auto_21297 ) ( FUEL-LEVEL ?auto_21304 ?auto_21301 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21299 ?auto_21298 ?auto_21297 )
      ( FLY-2PPL-VERIFY ?auto_21298 ?auto_21299 ?auto_21297 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21307 - PERSON
      ?auto_21308 - PERSON
      ?auto_21306 - CITY
    )
    :vars
    (
      ?auto_21312 - FLEVEL
      ?auto_21311 - FLEVEL
      ?auto_21310 - CITY
      ?auto_21309 - PERSON
      ?auto_21314 - CITY
      ?auto_21313 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21312 ?auto_21311 ) ( not ( = ?auto_21306 ?auto_21310 ) ) ( not ( = ?auto_21311 ?auto_21312 ) ) ( PERSON-AT ?auto_21309 ?auto_21306 ) ( not ( = ?auto_21309 ?auto_21307 ) ) ( PERSON-AT ?auto_21307 ?auto_21310 ) ( not ( = ?auto_21309 ?auto_21308 ) ) ( not ( = ?auto_21307 ?auto_21308 ) ) ( not ( = ?auto_21306 ?auto_21314 ) ) ( not ( = ?auto_21310 ?auto_21314 ) ) ( PERSON-AT ?auto_21308 ?auto_21314 ) ( AIRCRAFT-AT ?auto_21313 ?auto_21306 ) ( FUEL-LEVEL ?auto_21313 ?auto_21311 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21309 ?auto_21307 ?auto_21306 )
      ( FLY-2PPL-VERIFY ?auto_21307 ?auto_21308 ?auto_21306 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21326 - PERSON
      ?auto_21327 - PERSON
      ?auto_21328 - PERSON
      ?auto_21325 - CITY
    )
    :vars
    (
      ?auto_21332 - FLEVEL
      ?auto_21330 - FLEVEL
      ?auto_21329 - CITY
      ?auto_21331 - PERSON
      ?auto_21334 - CITY
      ?auto_21333 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21332 ?auto_21330 ) ( not ( = ?auto_21325 ?auto_21329 ) ) ( not ( = ?auto_21330 ?auto_21332 ) ) ( PERSON-AT ?auto_21327 ?auto_21325 ) ( not ( = ?auto_21327 ?auto_21328 ) ) ( PERSON-AT ?auto_21328 ?auto_21329 ) ( not ( = ?auto_21327 ?auto_21331 ) ) ( not ( = ?auto_21328 ?auto_21331 ) ) ( not ( = ?auto_21325 ?auto_21334 ) ) ( not ( = ?auto_21329 ?auto_21334 ) ) ( PERSON-AT ?auto_21331 ?auto_21334 ) ( AIRCRAFT-AT ?auto_21333 ?auto_21325 ) ( FUEL-LEVEL ?auto_21333 ?auto_21330 ) ( PERSON-AT ?auto_21326 ?auto_21325 ) ( not ( = ?auto_21326 ?auto_21327 ) ) ( not ( = ?auto_21326 ?auto_21328 ) ) ( not ( = ?auto_21326 ?auto_21331 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21327 ?auto_21328 ?auto_21325 )
      ( FLY-3PPL-VERIFY ?auto_21326 ?auto_21327 ?auto_21328 ?auto_21325 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21336 - PERSON
      ?auto_21337 - PERSON
      ?auto_21338 - PERSON
      ?auto_21335 - CITY
    )
    :vars
    (
      ?auto_21341 - FLEVEL
      ?auto_21340 - FLEVEL
      ?auto_21339 - CITY
      ?auto_21343 - CITY
      ?auto_21342 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21341 ?auto_21340 ) ( not ( = ?auto_21335 ?auto_21339 ) ) ( not ( = ?auto_21340 ?auto_21341 ) ) ( PERSON-AT ?auto_21336 ?auto_21335 ) ( not ( = ?auto_21336 ?auto_21338 ) ) ( PERSON-AT ?auto_21338 ?auto_21339 ) ( not ( = ?auto_21336 ?auto_21337 ) ) ( not ( = ?auto_21338 ?auto_21337 ) ) ( not ( = ?auto_21335 ?auto_21343 ) ) ( not ( = ?auto_21339 ?auto_21343 ) ) ( PERSON-AT ?auto_21337 ?auto_21343 ) ( AIRCRAFT-AT ?auto_21342 ?auto_21335 ) ( FUEL-LEVEL ?auto_21342 ?auto_21340 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21336 ?auto_21338 ?auto_21335 )
      ( FLY-3PPL-VERIFY ?auto_21336 ?auto_21337 ?auto_21338 ?auto_21335 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21345 - PERSON
      ?auto_21346 - PERSON
      ?auto_21347 - PERSON
      ?auto_21344 - CITY
    )
    :vars
    (
      ?auto_21351 - FLEVEL
      ?auto_21349 - FLEVEL
      ?auto_21348 - CITY
      ?auto_21350 - PERSON
      ?auto_21353 - CITY
      ?auto_21352 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21351 ?auto_21349 ) ( not ( = ?auto_21344 ?auto_21348 ) ) ( not ( = ?auto_21349 ?auto_21351 ) ) ( PERSON-AT ?auto_21347 ?auto_21344 ) ( not ( = ?auto_21347 ?auto_21346 ) ) ( PERSON-AT ?auto_21346 ?auto_21348 ) ( not ( = ?auto_21347 ?auto_21350 ) ) ( not ( = ?auto_21346 ?auto_21350 ) ) ( not ( = ?auto_21344 ?auto_21353 ) ) ( not ( = ?auto_21348 ?auto_21353 ) ) ( PERSON-AT ?auto_21350 ?auto_21353 ) ( AIRCRAFT-AT ?auto_21352 ?auto_21344 ) ( FUEL-LEVEL ?auto_21352 ?auto_21349 ) ( PERSON-AT ?auto_21345 ?auto_21344 ) ( not ( = ?auto_21345 ?auto_21346 ) ) ( not ( = ?auto_21345 ?auto_21347 ) ) ( not ( = ?auto_21345 ?auto_21350 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21347 ?auto_21346 ?auto_21344 )
      ( FLY-3PPL-VERIFY ?auto_21345 ?auto_21346 ?auto_21347 ?auto_21344 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21355 - PERSON
      ?auto_21356 - PERSON
      ?auto_21357 - PERSON
      ?auto_21354 - CITY
    )
    :vars
    (
      ?auto_21360 - FLEVEL
      ?auto_21359 - FLEVEL
      ?auto_21358 - CITY
      ?auto_21362 - CITY
      ?auto_21361 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21360 ?auto_21359 ) ( not ( = ?auto_21354 ?auto_21358 ) ) ( not ( = ?auto_21359 ?auto_21360 ) ) ( PERSON-AT ?auto_21355 ?auto_21354 ) ( not ( = ?auto_21355 ?auto_21356 ) ) ( PERSON-AT ?auto_21356 ?auto_21358 ) ( not ( = ?auto_21355 ?auto_21357 ) ) ( not ( = ?auto_21356 ?auto_21357 ) ) ( not ( = ?auto_21354 ?auto_21362 ) ) ( not ( = ?auto_21358 ?auto_21362 ) ) ( PERSON-AT ?auto_21357 ?auto_21362 ) ( AIRCRAFT-AT ?auto_21361 ?auto_21354 ) ( FUEL-LEVEL ?auto_21361 ?auto_21359 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21355 ?auto_21356 ?auto_21354 )
      ( FLY-3PPL-VERIFY ?auto_21355 ?auto_21356 ?auto_21357 ?auto_21354 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21374 - PERSON
      ?auto_21375 - PERSON
      ?auto_21376 - PERSON
      ?auto_21373 - CITY
    )
    :vars
    (
      ?auto_21379 - FLEVEL
      ?auto_21378 - FLEVEL
      ?auto_21377 - CITY
      ?auto_21381 - CITY
      ?auto_21380 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21379 ?auto_21378 ) ( not ( = ?auto_21373 ?auto_21377 ) ) ( not ( = ?auto_21378 ?auto_21379 ) ) ( PERSON-AT ?auto_21375 ?auto_21373 ) ( not ( = ?auto_21375 ?auto_21376 ) ) ( PERSON-AT ?auto_21376 ?auto_21377 ) ( not ( = ?auto_21375 ?auto_21374 ) ) ( not ( = ?auto_21376 ?auto_21374 ) ) ( not ( = ?auto_21373 ?auto_21381 ) ) ( not ( = ?auto_21377 ?auto_21381 ) ) ( PERSON-AT ?auto_21374 ?auto_21381 ) ( AIRCRAFT-AT ?auto_21380 ?auto_21373 ) ( FUEL-LEVEL ?auto_21380 ?auto_21378 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21375 ?auto_21376 ?auto_21373 )
      ( FLY-3PPL-VERIFY ?auto_21374 ?auto_21375 ?auto_21376 ?auto_21373 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21393 - PERSON
      ?auto_21394 - PERSON
      ?auto_21395 - PERSON
      ?auto_21392 - CITY
    )
    :vars
    (
      ?auto_21398 - FLEVEL
      ?auto_21397 - FLEVEL
      ?auto_21396 - CITY
      ?auto_21400 - CITY
      ?auto_21399 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21398 ?auto_21397 ) ( not ( = ?auto_21392 ?auto_21396 ) ) ( not ( = ?auto_21397 ?auto_21398 ) ) ( PERSON-AT ?auto_21395 ?auto_21392 ) ( not ( = ?auto_21395 ?auto_21394 ) ) ( PERSON-AT ?auto_21394 ?auto_21396 ) ( not ( = ?auto_21395 ?auto_21393 ) ) ( not ( = ?auto_21394 ?auto_21393 ) ) ( not ( = ?auto_21392 ?auto_21400 ) ) ( not ( = ?auto_21396 ?auto_21400 ) ) ( PERSON-AT ?auto_21393 ?auto_21400 ) ( AIRCRAFT-AT ?auto_21399 ?auto_21392 ) ( FUEL-LEVEL ?auto_21399 ?auto_21397 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21395 ?auto_21394 ?auto_21392 )
      ( FLY-3PPL-VERIFY ?auto_21393 ?auto_21394 ?auto_21395 ?auto_21392 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21422 - PERSON
      ?auto_21423 - PERSON
      ?auto_21424 - PERSON
      ?auto_21421 - CITY
    )
    :vars
    (
      ?auto_21428 - FLEVEL
      ?auto_21426 - FLEVEL
      ?auto_21425 - CITY
      ?auto_21427 - PERSON
      ?auto_21430 - CITY
      ?auto_21429 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21428 ?auto_21426 ) ( not ( = ?auto_21421 ?auto_21425 ) ) ( not ( = ?auto_21426 ?auto_21428 ) ) ( PERSON-AT ?auto_21424 ?auto_21421 ) ( not ( = ?auto_21424 ?auto_21422 ) ) ( PERSON-AT ?auto_21422 ?auto_21425 ) ( not ( = ?auto_21424 ?auto_21427 ) ) ( not ( = ?auto_21422 ?auto_21427 ) ) ( not ( = ?auto_21421 ?auto_21430 ) ) ( not ( = ?auto_21425 ?auto_21430 ) ) ( PERSON-AT ?auto_21427 ?auto_21430 ) ( AIRCRAFT-AT ?auto_21429 ?auto_21421 ) ( FUEL-LEVEL ?auto_21429 ?auto_21426 ) ( PERSON-AT ?auto_21423 ?auto_21421 ) ( not ( = ?auto_21422 ?auto_21423 ) ) ( not ( = ?auto_21423 ?auto_21424 ) ) ( not ( = ?auto_21423 ?auto_21427 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21424 ?auto_21422 ?auto_21421 )
      ( FLY-3PPL-VERIFY ?auto_21422 ?auto_21423 ?auto_21424 ?auto_21421 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21432 - PERSON
      ?auto_21433 - PERSON
      ?auto_21434 - PERSON
      ?auto_21431 - CITY
    )
    :vars
    (
      ?auto_21437 - FLEVEL
      ?auto_21436 - FLEVEL
      ?auto_21435 - CITY
      ?auto_21439 - CITY
      ?auto_21438 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21437 ?auto_21436 ) ( not ( = ?auto_21431 ?auto_21435 ) ) ( not ( = ?auto_21436 ?auto_21437 ) ) ( PERSON-AT ?auto_21433 ?auto_21431 ) ( not ( = ?auto_21433 ?auto_21432 ) ) ( PERSON-AT ?auto_21432 ?auto_21435 ) ( not ( = ?auto_21433 ?auto_21434 ) ) ( not ( = ?auto_21432 ?auto_21434 ) ) ( not ( = ?auto_21431 ?auto_21439 ) ) ( not ( = ?auto_21435 ?auto_21439 ) ) ( PERSON-AT ?auto_21434 ?auto_21439 ) ( AIRCRAFT-AT ?auto_21438 ?auto_21431 ) ( FUEL-LEVEL ?auto_21438 ?auto_21436 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21433 ?auto_21432 ?auto_21431 )
      ( FLY-3PPL-VERIFY ?auto_21432 ?auto_21433 ?auto_21434 ?auto_21431 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21451 - PERSON
      ?auto_21452 - PERSON
      ?auto_21453 - PERSON
      ?auto_21450 - CITY
    )
    :vars
    (
      ?auto_21456 - FLEVEL
      ?auto_21455 - FLEVEL
      ?auto_21454 - CITY
      ?auto_21458 - CITY
      ?auto_21457 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21456 ?auto_21455 ) ( not ( = ?auto_21450 ?auto_21454 ) ) ( not ( = ?auto_21455 ?auto_21456 ) ) ( PERSON-AT ?auto_21453 ?auto_21450 ) ( not ( = ?auto_21453 ?auto_21451 ) ) ( PERSON-AT ?auto_21451 ?auto_21454 ) ( not ( = ?auto_21453 ?auto_21452 ) ) ( not ( = ?auto_21451 ?auto_21452 ) ) ( not ( = ?auto_21450 ?auto_21458 ) ) ( not ( = ?auto_21454 ?auto_21458 ) ) ( PERSON-AT ?auto_21452 ?auto_21458 ) ( AIRCRAFT-AT ?auto_21457 ?auto_21450 ) ( FUEL-LEVEL ?auto_21457 ?auto_21455 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21453 ?auto_21451 ?auto_21450 )
      ( FLY-3PPL-VERIFY ?auto_21451 ?auto_21452 ?auto_21453 ?auto_21450 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_21511 - PERSON
      ?auto_21510 - CITY
    )
    :vars
    (
      ?auto_21516 - FLEVEL
      ?auto_21514 - FLEVEL
      ?auto_21513 - CITY
      ?auto_21512 - PERSON
      ?auto_21515 - PERSON
      ?auto_21518 - CITY
      ?auto_21517 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21516 ?auto_21514 ) ( not ( = ?auto_21510 ?auto_21513 ) ) ( not ( = ?auto_21514 ?auto_21516 ) ) ( PERSON-AT ?auto_21512 ?auto_21510 ) ( not ( = ?auto_21512 ?auto_21511 ) ) ( PERSON-AT ?auto_21511 ?auto_21513 ) ( not ( = ?auto_21512 ?auto_21515 ) ) ( not ( = ?auto_21511 ?auto_21515 ) ) ( not ( = ?auto_21510 ?auto_21518 ) ) ( not ( = ?auto_21513 ?auto_21518 ) ) ( PERSON-AT ?auto_21515 ?auto_21518 ) ( AIRCRAFT-AT ?auto_21517 ?auto_21510 ) ( FUEL-LEVEL ?auto_21517 ?auto_21516 ) )
    :subtasks
    ( ( !REFUEL ?auto_21517 ?auto_21510 ?auto_21516 ?auto_21514 )
      ( FLY-2PPL ?auto_21512 ?auto_21511 ?auto_21510 )
      ( FLY-1PPL-VERIFY ?auto_21511 ?auto_21510 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21520 - PERSON
      ?auto_21521 - PERSON
      ?auto_21519 - CITY
    )
    :vars
    (
      ?auto_21522 - FLEVEL
      ?auto_21525 - FLEVEL
      ?auto_21523 - CITY
      ?auto_21524 - PERSON
      ?auto_21527 - CITY
      ?auto_21526 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21522 ?auto_21525 ) ( not ( = ?auto_21519 ?auto_21523 ) ) ( not ( = ?auto_21525 ?auto_21522 ) ) ( PERSON-AT ?auto_21520 ?auto_21519 ) ( not ( = ?auto_21520 ?auto_21521 ) ) ( PERSON-AT ?auto_21521 ?auto_21523 ) ( not ( = ?auto_21520 ?auto_21524 ) ) ( not ( = ?auto_21521 ?auto_21524 ) ) ( not ( = ?auto_21519 ?auto_21527 ) ) ( not ( = ?auto_21523 ?auto_21527 ) ) ( PERSON-AT ?auto_21524 ?auto_21527 ) ( AIRCRAFT-AT ?auto_21526 ?auto_21519 ) ( FUEL-LEVEL ?auto_21526 ?auto_21522 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_21521 ?auto_21519 )
      ( FLY-2PPL-VERIFY ?auto_21520 ?auto_21521 ?auto_21519 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21529 - PERSON
      ?auto_21530 - PERSON
      ?auto_21528 - CITY
    )
    :vars
    (
      ?auto_21531 - FLEVEL
      ?auto_21532 - FLEVEL
      ?auto_21533 - CITY
      ?auto_21536 - PERSON
      ?auto_21534 - CITY
      ?auto_21535 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21531 ?auto_21532 ) ( not ( = ?auto_21528 ?auto_21533 ) ) ( not ( = ?auto_21532 ?auto_21531 ) ) ( PERSON-AT ?auto_21536 ?auto_21528 ) ( not ( = ?auto_21536 ?auto_21530 ) ) ( PERSON-AT ?auto_21530 ?auto_21533 ) ( not ( = ?auto_21536 ?auto_21529 ) ) ( not ( = ?auto_21530 ?auto_21529 ) ) ( not ( = ?auto_21528 ?auto_21534 ) ) ( not ( = ?auto_21533 ?auto_21534 ) ) ( PERSON-AT ?auto_21529 ?auto_21534 ) ( AIRCRAFT-AT ?auto_21535 ?auto_21528 ) ( FUEL-LEVEL ?auto_21535 ?auto_21531 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21536 ?auto_21530 ?auto_21528 )
      ( FLY-2PPL-VERIFY ?auto_21529 ?auto_21530 ?auto_21528 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21538 - PERSON
      ?auto_21539 - PERSON
      ?auto_21537 - CITY
    )
    :vars
    (
      ?auto_21540 - FLEVEL
      ?auto_21541 - FLEVEL
      ?auto_21543 - CITY
      ?auto_21542 - PERSON
      ?auto_21544 - CITY
      ?auto_21545 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21540 ?auto_21541 ) ( not ( = ?auto_21537 ?auto_21543 ) ) ( not ( = ?auto_21541 ?auto_21540 ) ) ( PERSON-AT ?auto_21539 ?auto_21537 ) ( not ( = ?auto_21539 ?auto_21538 ) ) ( PERSON-AT ?auto_21538 ?auto_21543 ) ( not ( = ?auto_21539 ?auto_21542 ) ) ( not ( = ?auto_21538 ?auto_21542 ) ) ( not ( = ?auto_21537 ?auto_21544 ) ) ( not ( = ?auto_21543 ?auto_21544 ) ) ( PERSON-AT ?auto_21542 ?auto_21544 ) ( AIRCRAFT-AT ?auto_21545 ?auto_21537 ) ( FUEL-LEVEL ?auto_21545 ?auto_21540 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21539 ?auto_21538 ?auto_21537 )
      ( FLY-2PPL-VERIFY ?auto_21538 ?auto_21539 ?auto_21537 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21547 - PERSON
      ?auto_21548 - PERSON
      ?auto_21546 - CITY
    )
    :vars
    (
      ?auto_21549 - FLEVEL
      ?auto_21550 - FLEVEL
      ?auto_21551 - CITY
      ?auto_21554 - PERSON
      ?auto_21552 - CITY
      ?auto_21553 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21549 ?auto_21550 ) ( not ( = ?auto_21546 ?auto_21551 ) ) ( not ( = ?auto_21550 ?auto_21549 ) ) ( PERSON-AT ?auto_21554 ?auto_21546 ) ( not ( = ?auto_21554 ?auto_21547 ) ) ( PERSON-AT ?auto_21547 ?auto_21551 ) ( not ( = ?auto_21554 ?auto_21548 ) ) ( not ( = ?auto_21547 ?auto_21548 ) ) ( not ( = ?auto_21546 ?auto_21552 ) ) ( not ( = ?auto_21551 ?auto_21552 ) ) ( PERSON-AT ?auto_21548 ?auto_21552 ) ( AIRCRAFT-AT ?auto_21553 ?auto_21546 ) ( FUEL-LEVEL ?auto_21553 ?auto_21549 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21554 ?auto_21547 ?auto_21546 )
      ( FLY-2PPL-VERIFY ?auto_21547 ?auto_21548 ?auto_21546 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21566 - PERSON
      ?auto_21567 - PERSON
      ?auto_21568 - PERSON
      ?auto_21565 - CITY
    )
    :vars
    (
      ?auto_21569 - FLEVEL
      ?auto_21570 - FLEVEL
      ?auto_21572 - CITY
      ?auto_21571 - PERSON
      ?auto_21573 - CITY
      ?auto_21574 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21569 ?auto_21570 ) ( not ( = ?auto_21565 ?auto_21572 ) ) ( not ( = ?auto_21570 ?auto_21569 ) ) ( PERSON-AT ?auto_21567 ?auto_21565 ) ( not ( = ?auto_21567 ?auto_21568 ) ) ( PERSON-AT ?auto_21568 ?auto_21572 ) ( not ( = ?auto_21567 ?auto_21571 ) ) ( not ( = ?auto_21568 ?auto_21571 ) ) ( not ( = ?auto_21565 ?auto_21573 ) ) ( not ( = ?auto_21572 ?auto_21573 ) ) ( PERSON-AT ?auto_21571 ?auto_21573 ) ( AIRCRAFT-AT ?auto_21574 ?auto_21565 ) ( FUEL-LEVEL ?auto_21574 ?auto_21569 ) ( PERSON-AT ?auto_21566 ?auto_21565 ) ( not ( = ?auto_21566 ?auto_21567 ) ) ( not ( = ?auto_21566 ?auto_21568 ) ) ( not ( = ?auto_21566 ?auto_21571 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21567 ?auto_21568 ?auto_21565 )
      ( FLY-3PPL-VERIFY ?auto_21566 ?auto_21567 ?auto_21568 ?auto_21565 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21576 - PERSON
      ?auto_21577 - PERSON
      ?auto_21578 - PERSON
      ?auto_21575 - CITY
    )
    :vars
    (
      ?auto_21579 - FLEVEL
      ?auto_21580 - FLEVEL
      ?auto_21581 - CITY
      ?auto_21582 - CITY
      ?auto_21583 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21579 ?auto_21580 ) ( not ( = ?auto_21575 ?auto_21581 ) ) ( not ( = ?auto_21580 ?auto_21579 ) ) ( PERSON-AT ?auto_21576 ?auto_21575 ) ( not ( = ?auto_21576 ?auto_21578 ) ) ( PERSON-AT ?auto_21578 ?auto_21581 ) ( not ( = ?auto_21576 ?auto_21577 ) ) ( not ( = ?auto_21578 ?auto_21577 ) ) ( not ( = ?auto_21575 ?auto_21582 ) ) ( not ( = ?auto_21581 ?auto_21582 ) ) ( PERSON-AT ?auto_21577 ?auto_21582 ) ( AIRCRAFT-AT ?auto_21583 ?auto_21575 ) ( FUEL-LEVEL ?auto_21583 ?auto_21579 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21576 ?auto_21578 ?auto_21575 )
      ( FLY-3PPL-VERIFY ?auto_21576 ?auto_21577 ?auto_21578 ?auto_21575 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21585 - PERSON
      ?auto_21586 - PERSON
      ?auto_21587 - PERSON
      ?auto_21584 - CITY
    )
    :vars
    (
      ?auto_21588 - FLEVEL
      ?auto_21589 - FLEVEL
      ?auto_21591 - CITY
      ?auto_21590 - PERSON
      ?auto_21592 - CITY
      ?auto_21593 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21588 ?auto_21589 ) ( not ( = ?auto_21584 ?auto_21591 ) ) ( not ( = ?auto_21589 ?auto_21588 ) ) ( PERSON-AT ?auto_21587 ?auto_21584 ) ( not ( = ?auto_21587 ?auto_21586 ) ) ( PERSON-AT ?auto_21586 ?auto_21591 ) ( not ( = ?auto_21587 ?auto_21590 ) ) ( not ( = ?auto_21586 ?auto_21590 ) ) ( not ( = ?auto_21584 ?auto_21592 ) ) ( not ( = ?auto_21591 ?auto_21592 ) ) ( PERSON-AT ?auto_21590 ?auto_21592 ) ( AIRCRAFT-AT ?auto_21593 ?auto_21584 ) ( FUEL-LEVEL ?auto_21593 ?auto_21588 ) ( PERSON-AT ?auto_21585 ?auto_21584 ) ( not ( = ?auto_21585 ?auto_21586 ) ) ( not ( = ?auto_21585 ?auto_21587 ) ) ( not ( = ?auto_21585 ?auto_21590 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21587 ?auto_21586 ?auto_21584 )
      ( FLY-3PPL-VERIFY ?auto_21585 ?auto_21586 ?auto_21587 ?auto_21584 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21595 - PERSON
      ?auto_21596 - PERSON
      ?auto_21597 - PERSON
      ?auto_21594 - CITY
    )
    :vars
    (
      ?auto_21598 - FLEVEL
      ?auto_21599 - FLEVEL
      ?auto_21600 - CITY
      ?auto_21601 - CITY
      ?auto_21602 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21598 ?auto_21599 ) ( not ( = ?auto_21594 ?auto_21600 ) ) ( not ( = ?auto_21599 ?auto_21598 ) ) ( PERSON-AT ?auto_21595 ?auto_21594 ) ( not ( = ?auto_21595 ?auto_21596 ) ) ( PERSON-AT ?auto_21596 ?auto_21600 ) ( not ( = ?auto_21595 ?auto_21597 ) ) ( not ( = ?auto_21596 ?auto_21597 ) ) ( not ( = ?auto_21594 ?auto_21601 ) ) ( not ( = ?auto_21600 ?auto_21601 ) ) ( PERSON-AT ?auto_21597 ?auto_21601 ) ( AIRCRAFT-AT ?auto_21602 ?auto_21594 ) ( FUEL-LEVEL ?auto_21602 ?auto_21598 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21595 ?auto_21596 ?auto_21594 )
      ( FLY-3PPL-VERIFY ?auto_21595 ?auto_21596 ?auto_21597 ?auto_21594 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21614 - PERSON
      ?auto_21615 - PERSON
      ?auto_21616 - PERSON
      ?auto_21613 - CITY
    )
    :vars
    (
      ?auto_21617 - FLEVEL
      ?auto_21618 - FLEVEL
      ?auto_21619 - CITY
      ?auto_21620 - CITY
      ?auto_21621 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21617 ?auto_21618 ) ( not ( = ?auto_21613 ?auto_21619 ) ) ( not ( = ?auto_21618 ?auto_21617 ) ) ( PERSON-AT ?auto_21615 ?auto_21613 ) ( not ( = ?auto_21615 ?auto_21616 ) ) ( PERSON-AT ?auto_21616 ?auto_21619 ) ( not ( = ?auto_21615 ?auto_21614 ) ) ( not ( = ?auto_21616 ?auto_21614 ) ) ( not ( = ?auto_21613 ?auto_21620 ) ) ( not ( = ?auto_21619 ?auto_21620 ) ) ( PERSON-AT ?auto_21614 ?auto_21620 ) ( AIRCRAFT-AT ?auto_21621 ?auto_21613 ) ( FUEL-LEVEL ?auto_21621 ?auto_21617 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21615 ?auto_21616 ?auto_21613 )
      ( FLY-3PPL-VERIFY ?auto_21614 ?auto_21615 ?auto_21616 ?auto_21613 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21633 - PERSON
      ?auto_21634 - PERSON
      ?auto_21635 - PERSON
      ?auto_21632 - CITY
    )
    :vars
    (
      ?auto_21636 - FLEVEL
      ?auto_21637 - FLEVEL
      ?auto_21638 - CITY
      ?auto_21639 - CITY
      ?auto_21640 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21636 ?auto_21637 ) ( not ( = ?auto_21632 ?auto_21638 ) ) ( not ( = ?auto_21637 ?auto_21636 ) ) ( PERSON-AT ?auto_21635 ?auto_21632 ) ( not ( = ?auto_21635 ?auto_21634 ) ) ( PERSON-AT ?auto_21634 ?auto_21638 ) ( not ( = ?auto_21635 ?auto_21633 ) ) ( not ( = ?auto_21634 ?auto_21633 ) ) ( not ( = ?auto_21632 ?auto_21639 ) ) ( not ( = ?auto_21638 ?auto_21639 ) ) ( PERSON-AT ?auto_21633 ?auto_21639 ) ( AIRCRAFT-AT ?auto_21640 ?auto_21632 ) ( FUEL-LEVEL ?auto_21640 ?auto_21636 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21635 ?auto_21634 ?auto_21632 )
      ( FLY-3PPL-VERIFY ?auto_21633 ?auto_21634 ?auto_21635 ?auto_21632 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21662 - PERSON
      ?auto_21663 - PERSON
      ?auto_21664 - PERSON
      ?auto_21661 - CITY
    )
    :vars
    (
      ?auto_21665 - FLEVEL
      ?auto_21666 - FLEVEL
      ?auto_21668 - CITY
      ?auto_21667 - PERSON
      ?auto_21669 - CITY
      ?auto_21670 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21665 ?auto_21666 ) ( not ( = ?auto_21661 ?auto_21668 ) ) ( not ( = ?auto_21666 ?auto_21665 ) ) ( PERSON-AT ?auto_21664 ?auto_21661 ) ( not ( = ?auto_21664 ?auto_21662 ) ) ( PERSON-AT ?auto_21662 ?auto_21668 ) ( not ( = ?auto_21664 ?auto_21667 ) ) ( not ( = ?auto_21662 ?auto_21667 ) ) ( not ( = ?auto_21661 ?auto_21669 ) ) ( not ( = ?auto_21668 ?auto_21669 ) ) ( PERSON-AT ?auto_21667 ?auto_21669 ) ( AIRCRAFT-AT ?auto_21670 ?auto_21661 ) ( FUEL-LEVEL ?auto_21670 ?auto_21665 ) ( PERSON-AT ?auto_21663 ?auto_21661 ) ( not ( = ?auto_21662 ?auto_21663 ) ) ( not ( = ?auto_21663 ?auto_21664 ) ) ( not ( = ?auto_21663 ?auto_21667 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21664 ?auto_21662 ?auto_21661 )
      ( FLY-3PPL-VERIFY ?auto_21662 ?auto_21663 ?auto_21664 ?auto_21661 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21672 - PERSON
      ?auto_21673 - PERSON
      ?auto_21674 - PERSON
      ?auto_21671 - CITY
    )
    :vars
    (
      ?auto_21675 - FLEVEL
      ?auto_21676 - FLEVEL
      ?auto_21677 - CITY
      ?auto_21678 - CITY
      ?auto_21679 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21675 ?auto_21676 ) ( not ( = ?auto_21671 ?auto_21677 ) ) ( not ( = ?auto_21676 ?auto_21675 ) ) ( PERSON-AT ?auto_21673 ?auto_21671 ) ( not ( = ?auto_21673 ?auto_21672 ) ) ( PERSON-AT ?auto_21672 ?auto_21677 ) ( not ( = ?auto_21673 ?auto_21674 ) ) ( not ( = ?auto_21672 ?auto_21674 ) ) ( not ( = ?auto_21671 ?auto_21678 ) ) ( not ( = ?auto_21677 ?auto_21678 ) ) ( PERSON-AT ?auto_21674 ?auto_21678 ) ( AIRCRAFT-AT ?auto_21679 ?auto_21671 ) ( FUEL-LEVEL ?auto_21679 ?auto_21675 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21673 ?auto_21672 ?auto_21671 )
      ( FLY-3PPL-VERIFY ?auto_21672 ?auto_21673 ?auto_21674 ?auto_21671 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21691 - PERSON
      ?auto_21692 - PERSON
      ?auto_21693 - PERSON
      ?auto_21690 - CITY
    )
    :vars
    (
      ?auto_21694 - FLEVEL
      ?auto_21695 - FLEVEL
      ?auto_21696 - CITY
      ?auto_21697 - CITY
      ?auto_21698 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21694 ?auto_21695 ) ( not ( = ?auto_21690 ?auto_21696 ) ) ( not ( = ?auto_21695 ?auto_21694 ) ) ( PERSON-AT ?auto_21693 ?auto_21690 ) ( not ( = ?auto_21693 ?auto_21691 ) ) ( PERSON-AT ?auto_21691 ?auto_21696 ) ( not ( = ?auto_21693 ?auto_21692 ) ) ( not ( = ?auto_21691 ?auto_21692 ) ) ( not ( = ?auto_21690 ?auto_21697 ) ) ( not ( = ?auto_21696 ?auto_21697 ) ) ( PERSON-AT ?auto_21692 ?auto_21697 ) ( AIRCRAFT-AT ?auto_21698 ?auto_21690 ) ( FUEL-LEVEL ?auto_21698 ?auto_21694 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21693 ?auto_21691 ?auto_21690 )
      ( FLY-3PPL-VERIFY ?auto_21691 ?auto_21692 ?auto_21693 ?auto_21690 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_21751 - PERSON
      ?auto_21750 - CITY
    )
    :vars
    (
      ?auto_21752 - FLEVEL
      ?auto_21753 - FLEVEL
      ?auto_21755 - CITY
      ?auto_21758 - PERSON
      ?auto_21754 - PERSON
      ?auto_21756 - CITY
      ?auto_21757 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21752 ?auto_21753 ) ( not ( = ?auto_21750 ?auto_21755 ) ) ( not ( = ?auto_21753 ?auto_21752 ) ) ( not ( = ?auto_21758 ?auto_21751 ) ) ( PERSON-AT ?auto_21751 ?auto_21755 ) ( not ( = ?auto_21758 ?auto_21754 ) ) ( not ( = ?auto_21751 ?auto_21754 ) ) ( not ( = ?auto_21750 ?auto_21756 ) ) ( not ( = ?auto_21755 ?auto_21756 ) ) ( PERSON-AT ?auto_21754 ?auto_21756 ) ( AIRCRAFT-AT ?auto_21757 ?auto_21750 ) ( FUEL-LEVEL ?auto_21757 ?auto_21752 ) ( IN ?auto_21758 ?auto_21757 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_21758 ?auto_21750 )
      ( FLY-2PPL ?auto_21758 ?auto_21751 ?auto_21750 )
      ( FLY-1PPL-VERIFY ?auto_21751 ?auto_21750 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21760 - PERSON
      ?auto_21761 - PERSON
      ?auto_21759 - CITY
    )
    :vars
    (
      ?auto_21766 - FLEVEL
      ?auto_21767 - FLEVEL
      ?auto_21764 - CITY
      ?auto_21763 - PERSON
      ?auto_21765 - CITY
      ?auto_21762 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21766 ?auto_21767 ) ( not ( = ?auto_21759 ?auto_21764 ) ) ( not ( = ?auto_21767 ?auto_21766 ) ) ( not ( = ?auto_21760 ?auto_21761 ) ) ( PERSON-AT ?auto_21761 ?auto_21764 ) ( not ( = ?auto_21760 ?auto_21763 ) ) ( not ( = ?auto_21761 ?auto_21763 ) ) ( not ( = ?auto_21759 ?auto_21765 ) ) ( not ( = ?auto_21764 ?auto_21765 ) ) ( PERSON-AT ?auto_21763 ?auto_21765 ) ( AIRCRAFT-AT ?auto_21762 ?auto_21759 ) ( FUEL-LEVEL ?auto_21762 ?auto_21766 ) ( IN ?auto_21760 ?auto_21762 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_21761 ?auto_21759 )
      ( FLY-2PPL-VERIFY ?auto_21760 ?auto_21761 ?auto_21759 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21769 - PERSON
      ?auto_21770 - PERSON
      ?auto_21768 - CITY
    )
    :vars
    (
      ?auto_21775 - FLEVEL
      ?auto_21774 - FLEVEL
      ?auto_21771 - CITY
      ?auto_21776 - PERSON
      ?auto_21773 - CITY
      ?auto_21772 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21775 ?auto_21774 ) ( not ( = ?auto_21768 ?auto_21771 ) ) ( not ( = ?auto_21774 ?auto_21775 ) ) ( not ( = ?auto_21776 ?auto_21770 ) ) ( PERSON-AT ?auto_21770 ?auto_21771 ) ( not ( = ?auto_21776 ?auto_21769 ) ) ( not ( = ?auto_21770 ?auto_21769 ) ) ( not ( = ?auto_21768 ?auto_21773 ) ) ( not ( = ?auto_21771 ?auto_21773 ) ) ( PERSON-AT ?auto_21769 ?auto_21773 ) ( AIRCRAFT-AT ?auto_21772 ?auto_21768 ) ( FUEL-LEVEL ?auto_21772 ?auto_21775 ) ( IN ?auto_21776 ?auto_21772 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21776 ?auto_21770 ?auto_21768 )
      ( FLY-2PPL-VERIFY ?auto_21769 ?auto_21770 ?auto_21768 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21778 - PERSON
      ?auto_21779 - PERSON
      ?auto_21777 - CITY
    )
    :vars
    (
      ?auto_21784 - FLEVEL
      ?auto_21783 - FLEVEL
      ?auto_21780 - CITY
      ?auto_21785 - PERSON
      ?auto_21782 - CITY
      ?auto_21781 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21784 ?auto_21783 ) ( not ( = ?auto_21777 ?auto_21780 ) ) ( not ( = ?auto_21783 ?auto_21784 ) ) ( not ( = ?auto_21779 ?auto_21778 ) ) ( PERSON-AT ?auto_21778 ?auto_21780 ) ( not ( = ?auto_21779 ?auto_21785 ) ) ( not ( = ?auto_21778 ?auto_21785 ) ) ( not ( = ?auto_21777 ?auto_21782 ) ) ( not ( = ?auto_21780 ?auto_21782 ) ) ( PERSON-AT ?auto_21785 ?auto_21782 ) ( AIRCRAFT-AT ?auto_21781 ?auto_21777 ) ( FUEL-LEVEL ?auto_21781 ?auto_21784 ) ( IN ?auto_21779 ?auto_21781 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21779 ?auto_21778 ?auto_21777 )
      ( FLY-2PPL-VERIFY ?auto_21778 ?auto_21779 ?auto_21777 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21787 - PERSON
      ?auto_21788 - PERSON
      ?auto_21786 - CITY
    )
    :vars
    (
      ?auto_21793 - FLEVEL
      ?auto_21792 - FLEVEL
      ?auto_21789 - CITY
      ?auto_21794 - PERSON
      ?auto_21791 - CITY
      ?auto_21790 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21793 ?auto_21792 ) ( not ( = ?auto_21786 ?auto_21789 ) ) ( not ( = ?auto_21792 ?auto_21793 ) ) ( not ( = ?auto_21794 ?auto_21787 ) ) ( PERSON-AT ?auto_21787 ?auto_21789 ) ( not ( = ?auto_21794 ?auto_21788 ) ) ( not ( = ?auto_21787 ?auto_21788 ) ) ( not ( = ?auto_21786 ?auto_21791 ) ) ( not ( = ?auto_21789 ?auto_21791 ) ) ( PERSON-AT ?auto_21788 ?auto_21791 ) ( AIRCRAFT-AT ?auto_21790 ?auto_21786 ) ( FUEL-LEVEL ?auto_21790 ?auto_21793 ) ( IN ?auto_21794 ?auto_21790 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21794 ?auto_21787 ?auto_21786 )
      ( FLY-2PPL-VERIFY ?auto_21787 ?auto_21788 ?auto_21786 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21816 - PERSON
      ?auto_21817 - PERSON
      ?auto_21818 - PERSON
      ?auto_21815 - CITY
    )
    :vars
    (
      ?auto_21823 - FLEVEL
      ?auto_21822 - FLEVEL
      ?auto_21819 - CITY
      ?auto_21821 - CITY
      ?auto_21820 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21823 ?auto_21822 ) ( not ( = ?auto_21815 ?auto_21819 ) ) ( not ( = ?auto_21822 ?auto_21823 ) ) ( not ( = ?auto_21816 ?auto_21818 ) ) ( PERSON-AT ?auto_21818 ?auto_21819 ) ( not ( = ?auto_21816 ?auto_21817 ) ) ( not ( = ?auto_21818 ?auto_21817 ) ) ( not ( = ?auto_21815 ?auto_21821 ) ) ( not ( = ?auto_21819 ?auto_21821 ) ) ( PERSON-AT ?auto_21817 ?auto_21821 ) ( AIRCRAFT-AT ?auto_21820 ?auto_21815 ) ( FUEL-LEVEL ?auto_21820 ?auto_21823 ) ( IN ?auto_21816 ?auto_21820 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21816 ?auto_21818 ?auto_21815 )
      ( FLY-3PPL-VERIFY ?auto_21816 ?auto_21817 ?auto_21818 ?auto_21815 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21835 - PERSON
      ?auto_21836 - PERSON
      ?auto_21837 - PERSON
      ?auto_21834 - CITY
    )
    :vars
    (
      ?auto_21842 - FLEVEL
      ?auto_21841 - FLEVEL
      ?auto_21838 - CITY
      ?auto_21840 - CITY
      ?auto_21839 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21842 ?auto_21841 ) ( not ( = ?auto_21834 ?auto_21838 ) ) ( not ( = ?auto_21841 ?auto_21842 ) ) ( not ( = ?auto_21835 ?auto_21836 ) ) ( PERSON-AT ?auto_21836 ?auto_21838 ) ( not ( = ?auto_21835 ?auto_21837 ) ) ( not ( = ?auto_21836 ?auto_21837 ) ) ( not ( = ?auto_21834 ?auto_21840 ) ) ( not ( = ?auto_21838 ?auto_21840 ) ) ( PERSON-AT ?auto_21837 ?auto_21840 ) ( AIRCRAFT-AT ?auto_21839 ?auto_21834 ) ( FUEL-LEVEL ?auto_21839 ?auto_21842 ) ( IN ?auto_21835 ?auto_21839 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21835 ?auto_21836 ?auto_21834 )
      ( FLY-3PPL-VERIFY ?auto_21835 ?auto_21836 ?auto_21837 ?auto_21834 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21854 - PERSON
      ?auto_21855 - PERSON
      ?auto_21856 - PERSON
      ?auto_21853 - CITY
    )
    :vars
    (
      ?auto_21861 - FLEVEL
      ?auto_21860 - FLEVEL
      ?auto_21857 - CITY
      ?auto_21859 - CITY
      ?auto_21858 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21861 ?auto_21860 ) ( not ( = ?auto_21853 ?auto_21857 ) ) ( not ( = ?auto_21860 ?auto_21861 ) ) ( not ( = ?auto_21855 ?auto_21856 ) ) ( PERSON-AT ?auto_21856 ?auto_21857 ) ( not ( = ?auto_21855 ?auto_21854 ) ) ( not ( = ?auto_21856 ?auto_21854 ) ) ( not ( = ?auto_21853 ?auto_21859 ) ) ( not ( = ?auto_21857 ?auto_21859 ) ) ( PERSON-AT ?auto_21854 ?auto_21859 ) ( AIRCRAFT-AT ?auto_21858 ?auto_21853 ) ( FUEL-LEVEL ?auto_21858 ?auto_21861 ) ( IN ?auto_21855 ?auto_21858 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21855 ?auto_21856 ?auto_21853 )
      ( FLY-3PPL-VERIFY ?auto_21854 ?auto_21855 ?auto_21856 ?auto_21853 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21873 - PERSON
      ?auto_21874 - PERSON
      ?auto_21875 - PERSON
      ?auto_21872 - CITY
    )
    :vars
    (
      ?auto_21880 - FLEVEL
      ?auto_21879 - FLEVEL
      ?auto_21876 - CITY
      ?auto_21878 - CITY
      ?auto_21877 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21880 ?auto_21879 ) ( not ( = ?auto_21872 ?auto_21876 ) ) ( not ( = ?auto_21879 ?auto_21880 ) ) ( not ( = ?auto_21875 ?auto_21874 ) ) ( PERSON-AT ?auto_21874 ?auto_21876 ) ( not ( = ?auto_21875 ?auto_21873 ) ) ( not ( = ?auto_21874 ?auto_21873 ) ) ( not ( = ?auto_21872 ?auto_21878 ) ) ( not ( = ?auto_21876 ?auto_21878 ) ) ( PERSON-AT ?auto_21873 ?auto_21878 ) ( AIRCRAFT-AT ?auto_21877 ?auto_21872 ) ( FUEL-LEVEL ?auto_21877 ?auto_21880 ) ( IN ?auto_21875 ?auto_21877 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21875 ?auto_21874 ?auto_21872 )
      ( FLY-3PPL-VERIFY ?auto_21873 ?auto_21874 ?auto_21875 ?auto_21872 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21912 - PERSON
      ?auto_21913 - PERSON
      ?auto_21914 - PERSON
      ?auto_21911 - CITY
    )
    :vars
    (
      ?auto_21919 - FLEVEL
      ?auto_21918 - FLEVEL
      ?auto_21915 - CITY
      ?auto_21917 - CITY
      ?auto_21916 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21919 ?auto_21918 ) ( not ( = ?auto_21911 ?auto_21915 ) ) ( not ( = ?auto_21918 ?auto_21919 ) ) ( not ( = ?auto_21913 ?auto_21912 ) ) ( PERSON-AT ?auto_21912 ?auto_21915 ) ( not ( = ?auto_21913 ?auto_21914 ) ) ( not ( = ?auto_21912 ?auto_21914 ) ) ( not ( = ?auto_21911 ?auto_21917 ) ) ( not ( = ?auto_21915 ?auto_21917 ) ) ( PERSON-AT ?auto_21914 ?auto_21917 ) ( AIRCRAFT-AT ?auto_21916 ?auto_21911 ) ( FUEL-LEVEL ?auto_21916 ?auto_21919 ) ( IN ?auto_21913 ?auto_21916 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21913 ?auto_21912 ?auto_21911 )
      ( FLY-3PPL-VERIFY ?auto_21912 ?auto_21913 ?auto_21914 ?auto_21911 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21931 - PERSON
      ?auto_21932 - PERSON
      ?auto_21933 - PERSON
      ?auto_21930 - CITY
    )
    :vars
    (
      ?auto_21938 - FLEVEL
      ?auto_21937 - FLEVEL
      ?auto_21934 - CITY
      ?auto_21936 - CITY
      ?auto_21935 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21938 ?auto_21937 ) ( not ( = ?auto_21930 ?auto_21934 ) ) ( not ( = ?auto_21937 ?auto_21938 ) ) ( not ( = ?auto_21933 ?auto_21931 ) ) ( PERSON-AT ?auto_21931 ?auto_21934 ) ( not ( = ?auto_21933 ?auto_21932 ) ) ( not ( = ?auto_21931 ?auto_21932 ) ) ( not ( = ?auto_21930 ?auto_21936 ) ) ( not ( = ?auto_21934 ?auto_21936 ) ) ( PERSON-AT ?auto_21932 ?auto_21936 ) ( AIRCRAFT-AT ?auto_21935 ?auto_21930 ) ( FUEL-LEVEL ?auto_21935 ?auto_21938 ) ( IN ?auto_21933 ?auto_21935 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21933 ?auto_21931 ?auto_21930 )
      ( FLY-3PPL-VERIFY ?auto_21931 ?auto_21932 ?auto_21933 ?auto_21930 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_21991 - PERSON
      ?auto_21990 - CITY
    )
    :vars
    (
      ?auto_21996 - FLEVEL
      ?auto_21995 - FLEVEL
      ?auto_21992 - CITY
      ?auto_21998 - PERSON
      ?auto_21997 - PERSON
      ?auto_21994 - CITY
      ?auto_21993 - AIRCRAFT
      ?auto_21999 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21996 ?auto_21995 ) ( not ( = ?auto_21990 ?auto_21992 ) ) ( not ( = ?auto_21995 ?auto_21996 ) ) ( not ( = ?auto_21998 ?auto_21991 ) ) ( PERSON-AT ?auto_21991 ?auto_21992 ) ( not ( = ?auto_21998 ?auto_21997 ) ) ( not ( = ?auto_21991 ?auto_21997 ) ) ( not ( = ?auto_21990 ?auto_21994 ) ) ( not ( = ?auto_21992 ?auto_21994 ) ) ( PERSON-AT ?auto_21997 ?auto_21994 ) ( IN ?auto_21998 ?auto_21993 ) ( AIRCRAFT-AT ?auto_21993 ?auto_21999 ) ( FUEL-LEVEL ?auto_21993 ?auto_21995 ) ( not ( = ?auto_21990 ?auto_21999 ) ) ( not ( = ?auto_21992 ?auto_21999 ) ) ( not ( = ?auto_21994 ?auto_21999 ) ) )
    :subtasks
    ( ( !FLY ?auto_21993 ?auto_21999 ?auto_21990 ?auto_21995 ?auto_21996 )
      ( FLY-2PPL ?auto_21998 ?auto_21991 ?auto_21990 )
      ( FLY-1PPL-VERIFY ?auto_21991 ?auto_21990 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22001 - PERSON
      ?auto_22002 - PERSON
      ?auto_22000 - CITY
    )
    :vars
    (
      ?auto_22004 - FLEVEL
      ?auto_22007 - FLEVEL
      ?auto_22005 - CITY
      ?auto_22008 - PERSON
      ?auto_22006 - CITY
      ?auto_22009 - AIRCRAFT
      ?auto_22003 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22004 ?auto_22007 ) ( not ( = ?auto_22000 ?auto_22005 ) ) ( not ( = ?auto_22007 ?auto_22004 ) ) ( not ( = ?auto_22001 ?auto_22002 ) ) ( PERSON-AT ?auto_22002 ?auto_22005 ) ( not ( = ?auto_22001 ?auto_22008 ) ) ( not ( = ?auto_22002 ?auto_22008 ) ) ( not ( = ?auto_22000 ?auto_22006 ) ) ( not ( = ?auto_22005 ?auto_22006 ) ) ( PERSON-AT ?auto_22008 ?auto_22006 ) ( IN ?auto_22001 ?auto_22009 ) ( AIRCRAFT-AT ?auto_22009 ?auto_22003 ) ( FUEL-LEVEL ?auto_22009 ?auto_22007 ) ( not ( = ?auto_22000 ?auto_22003 ) ) ( not ( = ?auto_22005 ?auto_22003 ) ) ( not ( = ?auto_22006 ?auto_22003 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_22002 ?auto_22000 )
      ( FLY-2PPL-VERIFY ?auto_22001 ?auto_22002 ?auto_22000 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22011 - PERSON
      ?auto_22012 - PERSON
      ?auto_22010 - CITY
    )
    :vars
    (
      ?auto_22017 - FLEVEL
      ?auto_22018 - FLEVEL
      ?auto_22013 - CITY
      ?auto_22019 - PERSON
      ?auto_22016 - CITY
      ?auto_22015 - AIRCRAFT
      ?auto_22014 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22017 ?auto_22018 ) ( not ( = ?auto_22010 ?auto_22013 ) ) ( not ( = ?auto_22018 ?auto_22017 ) ) ( not ( = ?auto_22019 ?auto_22012 ) ) ( PERSON-AT ?auto_22012 ?auto_22013 ) ( not ( = ?auto_22019 ?auto_22011 ) ) ( not ( = ?auto_22012 ?auto_22011 ) ) ( not ( = ?auto_22010 ?auto_22016 ) ) ( not ( = ?auto_22013 ?auto_22016 ) ) ( PERSON-AT ?auto_22011 ?auto_22016 ) ( IN ?auto_22019 ?auto_22015 ) ( AIRCRAFT-AT ?auto_22015 ?auto_22014 ) ( FUEL-LEVEL ?auto_22015 ?auto_22018 ) ( not ( = ?auto_22010 ?auto_22014 ) ) ( not ( = ?auto_22013 ?auto_22014 ) ) ( not ( = ?auto_22016 ?auto_22014 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22019 ?auto_22012 ?auto_22010 )
      ( FLY-2PPL-VERIFY ?auto_22011 ?auto_22012 ?auto_22010 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22021 - PERSON
      ?auto_22022 - PERSON
      ?auto_22020 - CITY
    )
    :vars
    (
      ?auto_22028 - FLEVEL
      ?auto_22029 - FLEVEL
      ?auto_22023 - CITY
      ?auto_22026 - PERSON
      ?auto_22027 - CITY
      ?auto_22025 - AIRCRAFT
      ?auto_22024 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22028 ?auto_22029 ) ( not ( = ?auto_22020 ?auto_22023 ) ) ( not ( = ?auto_22029 ?auto_22028 ) ) ( not ( = ?auto_22022 ?auto_22021 ) ) ( PERSON-AT ?auto_22021 ?auto_22023 ) ( not ( = ?auto_22022 ?auto_22026 ) ) ( not ( = ?auto_22021 ?auto_22026 ) ) ( not ( = ?auto_22020 ?auto_22027 ) ) ( not ( = ?auto_22023 ?auto_22027 ) ) ( PERSON-AT ?auto_22026 ?auto_22027 ) ( IN ?auto_22022 ?auto_22025 ) ( AIRCRAFT-AT ?auto_22025 ?auto_22024 ) ( FUEL-LEVEL ?auto_22025 ?auto_22029 ) ( not ( = ?auto_22020 ?auto_22024 ) ) ( not ( = ?auto_22023 ?auto_22024 ) ) ( not ( = ?auto_22027 ?auto_22024 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22022 ?auto_22021 ?auto_22020 )
      ( FLY-2PPL-VERIFY ?auto_22021 ?auto_22022 ?auto_22020 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22031 - PERSON
      ?auto_22032 - PERSON
      ?auto_22030 - CITY
    )
    :vars
    (
      ?auto_22037 - FLEVEL
      ?auto_22038 - FLEVEL
      ?auto_22033 - CITY
      ?auto_22039 - PERSON
      ?auto_22036 - CITY
      ?auto_22035 - AIRCRAFT
      ?auto_22034 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22037 ?auto_22038 ) ( not ( = ?auto_22030 ?auto_22033 ) ) ( not ( = ?auto_22038 ?auto_22037 ) ) ( not ( = ?auto_22039 ?auto_22031 ) ) ( PERSON-AT ?auto_22031 ?auto_22033 ) ( not ( = ?auto_22039 ?auto_22032 ) ) ( not ( = ?auto_22031 ?auto_22032 ) ) ( not ( = ?auto_22030 ?auto_22036 ) ) ( not ( = ?auto_22033 ?auto_22036 ) ) ( PERSON-AT ?auto_22032 ?auto_22036 ) ( IN ?auto_22039 ?auto_22035 ) ( AIRCRAFT-AT ?auto_22035 ?auto_22034 ) ( FUEL-LEVEL ?auto_22035 ?auto_22038 ) ( not ( = ?auto_22030 ?auto_22034 ) ) ( not ( = ?auto_22033 ?auto_22034 ) ) ( not ( = ?auto_22036 ?auto_22034 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22039 ?auto_22031 ?auto_22030 )
      ( FLY-2PPL-VERIFY ?auto_22031 ?auto_22032 ?auto_22030 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22063 - PERSON
      ?auto_22064 - PERSON
      ?auto_22065 - PERSON
      ?auto_22062 - CITY
    )
    :vars
    (
      ?auto_22070 - FLEVEL
      ?auto_22071 - FLEVEL
      ?auto_22066 - CITY
      ?auto_22069 - CITY
      ?auto_22068 - AIRCRAFT
      ?auto_22067 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22070 ?auto_22071 ) ( not ( = ?auto_22062 ?auto_22066 ) ) ( not ( = ?auto_22071 ?auto_22070 ) ) ( not ( = ?auto_22063 ?auto_22065 ) ) ( PERSON-AT ?auto_22065 ?auto_22066 ) ( not ( = ?auto_22063 ?auto_22064 ) ) ( not ( = ?auto_22065 ?auto_22064 ) ) ( not ( = ?auto_22062 ?auto_22069 ) ) ( not ( = ?auto_22066 ?auto_22069 ) ) ( PERSON-AT ?auto_22064 ?auto_22069 ) ( IN ?auto_22063 ?auto_22068 ) ( AIRCRAFT-AT ?auto_22068 ?auto_22067 ) ( FUEL-LEVEL ?auto_22068 ?auto_22071 ) ( not ( = ?auto_22062 ?auto_22067 ) ) ( not ( = ?auto_22066 ?auto_22067 ) ) ( not ( = ?auto_22069 ?auto_22067 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22063 ?auto_22065 ?auto_22062 )
      ( FLY-3PPL-VERIFY ?auto_22063 ?auto_22064 ?auto_22065 ?auto_22062 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22084 - PERSON
      ?auto_22085 - PERSON
      ?auto_22086 - PERSON
      ?auto_22083 - CITY
    )
    :vars
    (
      ?auto_22091 - FLEVEL
      ?auto_22092 - FLEVEL
      ?auto_22087 - CITY
      ?auto_22090 - CITY
      ?auto_22089 - AIRCRAFT
      ?auto_22088 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22091 ?auto_22092 ) ( not ( = ?auto_22083 ?auto_22087 ) ) ( not ( = ?auto_22092 ?auto_22091 ) ) ( not ( = ?auto_22084 ?auto_22085 ) ) ( PERSON-AT ?auto_22085 ?auto_22087 ) ( not ( = ?auto_22084 ?auto_22086 ) ) ( not ( = ?auto_22085 ?auto_22086 ) ) ( not ( = ?auto_22083 ?auto_22090 ) ) ( not ( = ?auto_22087 ?auto_22090 ) ) ( PERSON-AT ?auto_22086 ?auto_22090 ) ( IN ?auto_22084 ?auto_22089 ) ( AIRCRAFT-AT ?auto_22089 ?auto_22088 ) ( FUEL-LEVEL ?auto_22089 ?auto_22092 ) ( not ( = ?auto_22083 ?auto_22088 ) ) ( not ( = ?auto_22087 ?auto_22088 ) ) ( not ( = ?auto_22090 ?auto_22088 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22084 ?auto_22085 ?auto_22083 )
      ( FLY-3PPL-VERIFY ?auto_22084 ?auto_22085 ?auto_22086 ?auto_22083 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22105 - PERSON
      ?auto_22106 - PERSON
      ?auto_22107 - PERSON
      ?auto_22104 - CITY
    )
    :vars
    (
      ?auto_22112 - FLEVEL
      ?auto_22113 - FLEVEL
      ?auto_22108 - CITY
      ?auto_22111 - CITY
      ?auto_22110 - AIRCRAFT
      ?auto_22109 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22112 ?auto_22113 ) ( not ( = ?auto_22104 ?auto_22108 ) ) ( not ( = ?auto_22113 ?auto_22112 ) ) ( not ( = ?auto_22106 ?auto_22107 ) ) ( PERSON-AT ?auto_22107 ?auto_22108 ) ( not ( = ?auto_22106 ?auto_22105 ) ) ( not ( = ?auto_22107 ?auto_22105 ) ) ( not ( = ?auto_22104 ?auto_22111 ) ) ( not ( = ?auto_22108 ?auto_22111 ) ) ( PERSON-AT ?auto_22105 ?auto_22111 ) ( IN ?auto_22106 ?auto_22110 ) ( AIRCRAFT-AT ?auto_22110 ?auto_22109 ) ( FUEL-LEVEL ?auto_22110 ?auto_22113 ) ( not ( = ?auto_22104 ?auto_22109 ) ) ( not ( = ?auto_22108 ?auto_22109 ) ) ( not ( = ?auto_22111 ?auto_22109 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22106 ?auto_22107 ?auto_22104 )
      ( FLY-3PPL-VERIFY ?auto_22105 ?auto_22106 ?auto_22107 ?auto_22104 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22126 - PERSON
      ?auto_22127 - PERSON
      ?auto_22128 - PERSON
      ?auto_22125 - CITY
    )
    :vars
    (
      ?auto_22133 - FLEVEL
      ?auto_22134 - FLEVEL
      ?auto_22129 - CITY
      ?auto_22132 - CITY
      ?auto_22131 - AIRCRAFT
      ?auto_22130 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22133 ?auto_22134 ) ( not ( = ?auto_22125 ?auto_22129 ) ) ( not ( = ?auto_22134 ?auto_22133 ) ) ( not ( = ?auto_22128 ?auto_22127 ) ) ( PERSON-AT ?auto_22127 ?auto_22129 ) ( not ( = ?auto_22128 ?auto_22126 ) ) ( not ( = ?auto_22127 ?auto_22126 ) ) ( not ( = ?auto_22125 ?auto_22132 ) ) ( not ( = ?auto_22129 ?auto_22132 ) ) ( PERSON-AT ?auto_22126 ?auto_22132 ) ( IN ?auto_22128 ?auto_22131 ) ( AIRCRAFT-AT ?auto_22131 ?auto_22130 ) ( FUEL-LEVEL ?auto_22131 ?auto_22134 ) ( not ( = ?auto_22125 ?auto_22130 ) ) ( not ( = ?auto_22129 ?auto_22130 ) ) ( not ( = ?auto_22132 ?auto_22130 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22128 ?auto_22127 ?auto_22125 )
      ( FLY-3PPL-VERIFY ?auto_22126 ?auto_22127 ?auto_22128 ?auto_22125 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22169 - PERSON
      ?auto_22170 - PERSON
      ?auto_22171 - PERSON
      ?auto_22168 - CITY
    )
    :vars
    (
      ?auto_22176 - FLEVEL
      ?auto_22177 - FLEVEL
      ?auto_22172 - CITY
      ?auto_22175 - CITY
      ?auto_22174 - AIRCRAFT
      ?auto_22173 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22176 ?auto_22177 ) ( not ( = ?auto_22168 ?auto_22172 ) ) ( not ( = ?auto_22177 ?auto_22176 ) ) ( not ( = ?auto_22170 ?auto_22169 ) ) ( PERSON-AT ?auto_22169 ?auto_22172 ) ( not ( = ?auto_22170 ?auto_22171 ) ) ( not ( = ?auto_22169 ?auto_22171 ) ) ( not ( = ?auto_22168 ?auto_22175 ) ) ( not ( = ?auto_22172 ?auto_22175 ) ) ( PERSON-AT ?auto_22171 ?auto_22175 ) ( IN ?auto_22170 ?auto_22174 ) ( AIRCRAFT-AT ?auto_22174 ?auto_22173 ) ( FUEL-LEVEL ?auto_22174 ?auto_22177 ) ( not ( = ?auto_22168 ?auto_22173 ) ) ( not ( = ?auto_22172 ?auto_22173 ) ) ( not ( = ?auto_22175 ?auto_22173 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22170 ?auto_22169 ?auto_22168 )
      ( FLY-3PPL-VERIFY ?auto_22169 ?auto_22170 ?auto_22171 ?auto_22168 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22190 - PERSON
      ?auto_22191 - PERSON
      ?auto_22192 - PERSON
      ?auto_22189 - CITY
    )
    :vars
    (
      ?auto_22197 - FLEVEL
      ?auto_22198 - FLEVEL
      ?auto_22193 - CITY
      ?auto_22196 - CITY
      ?auto_22195 - AIRCRAFT
      ?auto_22194 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22197 ?auto_22198 ) ( not ( = ?auto_22189 ?auto_22193 ) ) ( not ( = ?auto_22198 ?auto_22197 ) ) ( not ( = ?auto_22192 ?auto_22190 ) ) ( PERSON-AT ?auto_22190 ?auto_22193 ) ( not ( = ?auto_22192 ?auto_22191 ) ) ( not ( = ?auto_22190 ?auto_22191 ) ) ( not ( = ?auto_22189 ?auto_22196 ) ) ( not ( = ?auto_22193 ?auto_22196 ) ) ( PERSON-AT ?auto_22191 ?auto_22196 ) ( IN ?auto_22192 ?auto_22195 ) ( AIRCRAFT-AT ?auto_22195 ?auto_22194 ) ( FUEL-LEVEL ?auto_22195 ?auto_22198 ) ( not ( = ?auto_22189 ?auto_22194 ) ) ( not ( = ?auto_22193 ?auto_22194 ) ) ( not ( = ?auto_22196 ?auto_22194 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22192 ?auto_22190 ?auto_22189 )
      ( FLY-3PPL-VERIFY ?auto_22190 ?auto_22191 ?auto_22192 ?auto_22189 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_22256 - PERSON
      ?auto_22255 - CITY
    )
    :vars
    (
      ?auto_22262 - FLEVEL
      ?auto_22263 - FLEVEL
      ?auto_22257 - CITY
      ?auto_22264 - PERSON
      ?auto_22260 - PERSON
      ?auto_22261 - CITY
      ?auto_22259 - AIRCRAFT
      ?auto_22258 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22262 ?auto_22263 ) ( not ( = ?auto_22255 ?auto_22257 ) ) ( not ( = ?auto_22263 ?auto_22262 ) ) ( not ( = ?auto_22264 ?auto_22256 ) ) ( PERSON-AT ?auto_22256 ?auto_22257 ) ( not ( = ?auto_22264 ?auto_22260 ) ) ( not ( = ?auto_22256 ?auto_22260 ) ) ( not ( = ?auto_22255 ?auto_22261 ) ) ( not ( = ?auto_22257 ?auto_22261 ) ) ( PERSON-AT ?auto_22260 ?auto_22261 ) ( AIRCRAFT-AT ?auto_22259 ?auto_22258 ) ( FUEL-LEVEL ?auto_22259 ?auto_22263 ) ( not ( = ?auto_22255 ?auto_22258 ) ) ( not ( = ?auto_22257 ?auto_22258 ) ) ( not ( = ?auto_22261 ?auto_22258 ) ) ( PERSON-AT ?auto_22264 ?auto_22258 ) )
    :subtasks
    ( ( !BOARD ?auto_22264 ?auto_22259 ?auto_22258 )
      ( FLY-2PPL ?auto_22264 ?auto_22256 ?auto_22255 )
      ( FLY-1PPL-VERIFY ?auto_22256 ?auto_22255 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22266 - PERSON
      ?auto_22267 - PERSON
      ?auto_22265 - CITY
    )
    :vars
    (
      ?auto_22268 - FLEVEL
      ?auto_22272 - FLEVEL
      ?auto_22269 - CITY
      ?auto_22274 - PERSON
      ?auto_22271 - CITY
      ?auto_22273 - AIRCRAFT
      ?auto_22270 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22268 ?auto_22272 ) ( not ( = ?auto_22265 ?auto_22269 ) ) ( not ( = ?auto_22272 ?auto_22268 ) ) ( not ( = ?auto_22266 ?auto_22267 ) ) ( PERSON-AT ?auto_22267 ?auto_22269 ) ( not ( = ?auto_22266 ?auto_22274 ) ) ( not ( = ?auto_22267 ?auto_22274 ) ) ( not ( = ?auto_22265 ?auto_22271 ) ) ( not ( = ?auto_22269 ?auto_22271 ) ) ( PERSON-AT ?auto_22274 ?auto_22271 ) ( AIRCRAFT-AT ?auto_22273 ?auto_22270 ) ( FUEL-LEVEL ?auto_22273 ?auto_22272 ) ( not ( = ?auto_22265 ?auto_22270 ) ) ( not ( = ?auto_22269 ?auto_22270 ) ) ( not ( = ?auto_22271 ?auto_22270 ) ) ( PERSON-AT ?auto_22266 ?auto_22270 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_22267 ?auto_22265 )
      ( FLY-2PPL-VERIFY ?auto_22266 ?auto_22267 ?auto_22265 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22276 - PERSON
      ?auto_22277 - PERSON
      ?auto_22275 - CITY
    )
    :vars
    (
      ?auto_22280 - FLEVEL
      ?auto_22278 - FLEVEL
      ?auto_22279 - CITY
      ?auto_22284 - PERSON
      ?auto_22282 - CITY
      ?auto_22283 - AIRCRAFT
      ?auto_22281 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22280 ?auto_22278 ) ( not ( = ?auto_22275 ?auto_22279 ) ) ( not ( = ?auto_22278 ?auto_22280 ) ) ( not ( = ?auto_22284 ?auto_22277 ) ) ( PERSON-AT ?auto_22277 ?auto_22279 ) ( not ( = ?auto_22284 ?auto_22276 ) ) ( not ( = ?auto_22277 ?auto_22276 ) ) ( not ( = ?auto_22275 ?auto_22282 ) ) ( not ( = ?auto_22279 ?auto_22282 ) ) ( PERSON-AT ?auto_22276 ?auto_22282 ) ( AIRCRAFT-AT ?auto_22283 ?auto_22281 ) ( FUEL-LEVEL ?auto_22283 ?auto_22278 ) ( not ( = ?auto_22275 ?auto_22281 ) ) ( not ( = ?auto_22279 ?auto_22281 ) ) ( not ( = ?auto_22282 ?auto_22281 ) ) ( PERSON-AT ?auto_22284 ?auto_22281 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22284 ?auto_22277 ?auto_22275 )
      ( FLY-2PPL-VERIFY ?auto_22276 ?auto_22277 ?auto_22275 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22286 - PERSON
      ?auto_22287 - PERSON
      ?auto_22285 - CITY
    )
    :vars
    (
      ?auto_22291 - FLEVEL
      ?auto_22288 - FLEVEL
      ?auto_22290 - CITY
      ?auto_22289 - PERSON
      ?auto_22293 - CITY
      ?auto_22294 - AIRCRAFT
      ?auto_22292 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22291 ?auto_22288 ) ( not ( = ?auto_22285 ?auto_22290 ) ) ( not ( = ?auto_22288 ?auto_22291 ) ) ( not ( = ?auto_22287 ?auto_22286 ) ) ( PERSON-AT ?auto_22286 ?auto_22290 ) ( not ( = ?auto_22287 ?auto_22289 ) ) ( not ( = ?auto_22286 ?auto_22289 ) ) ( not ( = ?auto_22285 ?auto_22293 ) ) ( not ( = ?auto_22290 ?auto_22293 ) ) ( PERSON-AT ?auto_22289 ?auto_22293 ) ( AIRCRAFT-AT ?auto_22294 ?auto_22292 ) ( FUEL-LEVEL ?auto_22294 ?auto_22288 ) ( not ( = ?auto_22285 ?auto_22292 ) ) ( not ( = ?auto_22290 ?auto_22292 ) ) ( not ( = ?auto_22293 ?auto_22292 ) ) ( PERSON-AT ?auto_22287 ?auto_22292 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22287 ?auto_22286 ?auto_22285 )
      ( FLY-2PPL-VERIFY ?auto_22286 ?auto_22287 ?auto_22285 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22296 - PERSON
      ?auto_22297 - PERSON
      ?auto_22295 - CITY
    )
    :vars
    (
      ?auto_22300 - FLEVEL
      ?auto_22298 - FLEVEL
      ?auto_22299 - CITY
      ?auto_22304 - PERSON
      ?auto_22302 - CITY
      ?auto_22303 - AIRCRAFT
      ?auto_22301 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22300 ?auto_22298 ) ( not ( = ?auto_22295 ?auto_22299 ) ) ( not ( = ?auto_22298 ?auto_22300 ) ) ( not ( = ?auto_22304 ?auto_22296 ) ) ( PERSON-AT ?auto_22296 ?auto_22299 ) ( not ( = ?auto_22304 ?auto_22297 ) ) ( not ( = ?auto_22296 ?auto_22297 ) ) ( not ( = ?auto_22295 ?auto_22302 ) ) ( not ( = ?auto_22299 ?auto_22302 ) ) ( PERSON-AT ?auto_22297 ?auto_22302 ) ( AIRCRAFT-AT ?auto_22303 ?auto_22301 ) ( FUEL-LEVEL ?auto_22303 ?auto_22298 ) ( not ( = ?auto_22295 ?auto_22301 ) ) ( not ( = ?auto_22299 ?auto_22301 ) ) ( not ( = ?auto_22302 ?auto_22301 ) ) ( PERSON-AT ?auto_22304 ?auto_22301 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22304 ?auto_22296 ?auto_22295 )
      ( FLY-2PPL-VERIFY ?auto_22296 ?auto_22297 ?auto_22295 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22328 - PERSON
      ?auto_22329 - PERSON
      ?auto_22330 - PERSON
      ?auto_22327 - CITY
    )
    :vars
    (
      ?auto_22333 - FLEVEL
      ?auto_22331 - FLEVEL
      ?auto_22332 - CITY
      ?auto_22335 - CITY
      ?auto_22336 - AIRCRAFT
      ?auto_22334 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22333 ?auto_22331 ) ( not ( = ?auto_22327 ?auto_22332 ) ) ( not ( = ?auto_22331 ?auto_22333 ) ) ( not ( = ?auto_22328 ?auto_22330 ) ) ( PERSON-AT ?auto_22330 ?auto_22332 ) ( not ( = ?auto_22328 ?auto_22329 ) ) ( not ( = ?auto_22330 ?auto_22329 ) ) ( not ( = ?auto_22327 ?auto_22335 ) ) ( not ( = ?auto_22332 ?auto_22335 ) ) ( PERSON-AT ?auto_22329 ?auto_22335 ) ( AIRCRAFT-AT ?auto_22336 ?auto_22334 ) ( FUEL-LEVEL ?auto_22336 ?auto_22331 ) ( not ( = ?auto_22327 ?auto_22334 ) ) ( not ( = ?auto_22332 ?auto_22334 ) ) ( not ( = ?auto_22335 ?auto_22334 ) ) ( PERSON-AT ?auto_22328 ?auto_22334 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22328 ?auto_22330 ?auto_22327 )
      ( FLY-3PPL-VERIFY ?auto_22328 ?auto_22329 ?auto_22330 ?auto_22327 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22349 - PERSON
      ?auto_22350 - PERSON
      ?auto_22351 - PERSON
      ?auto_22348 - CITY
    )
    :vars
    (
      ?auto_22354 - FLEVEL
      ?auto_22352 - FLEVEL
      ?auto_22353 - CITY
      ?auto_22356 - CITY
      ?auto_22357 - AIRCRAFT
      ?auto_22355 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22354 ?auto_22352 ) ( not ( = ?auto_22348 ?auto_22353 ) ) ( not ( = ?auto_22352 ?auto_22354 ) ) ( not ( = ?auto_22349 ?auto_22350 ) ) ( PERSON-AT ?auto_22350 ?auto_22353 ) ( not ( = ?auto_22349 ?auto_22351 ) ) ( not ( = ?auto_22350 ?auto_22351 ) ) ( not ( = ?auto_22348 ?auto_22356 ) ) ( not ( = ?auto_22353 ?auto_22356 ) ) ( PERSON-AT ?auto_22351 ?auto_22356 ) ( AIRCRAFT-AT ?auto_22357 ?auto_22355 ) ( FUEL-LEVEL ?auto_22357 ?auto_22352 ) ( not ( = ?auto_22348 ?auto_22355 ) ) ( not ( = ?auto_22353 ?auto_22355 ) ) ( not ( = ?auto_22356 ?auto_22355 ) ) ( PERSON-AT ?auto_22349 ?auto_22355 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22349 ?auto_22350 ?auto_22348 )
      ( FLY-3PPL-VERIFY ?auto_22349 ?auto_22350 ?auto_22351 ?auto_22348 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22370 - PERSON
      ?auto_22371 - PERSON
      ?auto_22372 - PERSON
      ?auto_22369 - CITY
    )
    :vars
    (
      ?auto_22375 - FLEVEL
      ?auto_22373 - FLEVEL
      ?auto_22374 - CITY
      ?auto_22377 - CITY
      ?auto_22378 - AIRCRAFT
      ?auto_22376 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22375 ?auto_22373 ) ( not ( = ?auto_22369 ?auto_22374 ) ) ( not ( = ?auto_22373 ?auto_22375 ) ) ( not ( = ?auto_22371 ?auto_22372 ) ) ( PERSON-AT ?auto_22372 ?auto_22374 ) ( not ( = ?auto_22371 ?auto_22370 ) ) ( not ( = ?auto_22372 ?auto_22370 ) ) ( not ( = ?auto_22369 ?auto_22377 ) ) ( not ( = ?auto_22374 ?auto_22377 ) ) ( PERSON-AT ?auto_22370 ?auto_22377 ) ( AIRCRAFT-AT ?auto_22378 ?auto_22376 ) ( FUEL-LEVEL ?auto_22378 ?auto_22373 ) ( not ( = ?auto_22369 ?auto_22376 ) ) ( not ( = ?auto_22374 ?auto_22376 ) ) ( not ( = ?auto_22377 ?auto_22376 ) ) ( PERSON-AT ?auto_22371 ?auto_22376 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22371 ?auto_22372 ?auto_22369 )
      ( FLY-3PPL-VERIFY ?auto_22370 ?auto_22371 ?auto_22372 ?auto_22369 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22391 - PERSON
      ?auto_22392 - PERSON
      ?auto_22393 - PERSON
      ?auto_22390 - CITY
    )
    :vars
    (
      ?auto_22396 - FLEVEL
      ?auto_22394 - FLEVEL
      ?auto_22395 - CITY
      ?auto_22398 - CITY
      ?auto_22399 - AIRCRAFT
      ?auto_22397 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22396 ?auto_22394 ) ( not ( = ?auto_22390 ?auto_22395 ) ) ( not ( = ?auto_22394 ?auto_22396 ) ) ( not ( = ?auto_22393 ?auto_22392 ) ) ( PERSON-AT ?auto_22392 ?auto_22395 ) ( not ( = ?auto_22393 ?auto_22391 ) ) ( not ( = ?auto_22392 ?auto_22391 ) ) ( not ( = ?auto_22390 ?auto_22398 ) ) ( not ( = ?auto_22395 ?auto_22398 ) ) ( PERSON-AT ?auto_22391 ?auto_22398 ) ( AIRCRAFT-AT ?auto_22399 ?auto_22397 ) ( FUEL-LEVEL ?auto_22399 ?auto_22394 ) ( not ( = ?auto_22390 ?auto_22397 ) ) ( not ( = ?auto_22395 ?auto_22397 ) ) ( not ( = ?auto_22398 ?auto_22397 ) ) ( PERSON-AT ?auto_22393 ?auto_22397 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22393 ?auto_22392 ?auto_22390 )
      ( FLY-3PPL-VERIFY ?auto_22391 ?auto_22392 ?auto_22393 ?auto_22390 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22434 - PERSON
      ?auto_22435 - PERSON
      ?auto_22436 - PERSON
      ?auto_22433 - CITY
    )
    :vars
    (
      ?auto_22439 - FLEVEL
      ?auto_22437 - FLEVEL
      ?auto_22438 - CITY
      ?auto_22441 - CITY
      ?auto_22442 - AIRCRAFT
      ?auto_22440 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22439 ?auto_22437 ) ( not ( = ?auto_22433 ?auto_22438 ) ) ( not ( = ?auto_22437 ?auto_22439 ) ) ( not ( = ?auto_22435 ?auto_22434 ) ) ( PERSON-AT ?auto_22434 ?auto_22438 ) ( not ( = ?auto_22435 ?auto_22436 ) ) ( not ( = ?auto_22434 ?auto_22436 ) ) ( not ( = ?auto_22433 ?auto_22441 ) ) ( not ( = ?auto_22438 ?auto_22441 ) ) ( PERSON-AT ?auto_22436 ?auto_22441 ) ( AIRCRAFT-AT ?auto_22442 ?auto_22440 ) ( FUEL-LEVEL ?auto_22442 ?auto_22437 ) ( not ( = ?auto_22433 ?auto_22440 ) ) ( not ( = ?auto_22438 ?auto_22440 ) ) ( not ( = ?auto_22441 ?auto_22440 ) ) ( PERSON-AT ?auto_22435 ?auto_22440 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22435 ?auto_22434 ?auto_22433 )
      ( FLY-3PPL-VERIFY ?auto_22434 ?auto_22435 ?auto_22436 ?auto_22433 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22455 - PERSON
      ?auto_22456 - PERSON
      ?auto_22457 - PERSON
      ?auto_22454 - CITY
    )
    :vars
    (
      ?auto_22460 - FLEVEL
      ?auto_22458 - FLEVEL
      ?auto_22459 - CITY
      ?auto_22462 - CITY
      ?auto_22463 - AIRCRAFT
      ?auto_22461 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22460 ?auto_22458 ) ( not ( = ?auto_22454 ?auto_22459 ) ) ( not ( = ?auto_22458 ?auto_22460 ) ) ( not ( = ?auto_22457 ?auto_22455 ) ) ( PERSON-AT ?auto_22455 ?auto_22459 ) ( not ( = ?auto_22457 ?auto_22456 ) ) ( not ( = ?auto_22455 ?auto_22456 ) ) ( not ( = ?auto_22454 ?auto_22462 ) ) ( not ( = ?auto_22459 ?auto_22462 ) ) ( PERSON-AT ?auto_22456 ?auto_22462 ) ( AIRCRAFT-AT ?auto_22463 ?auto_22461 ) ( FUEL-LEVEL ?auto_22463 ?auto_22458 ) ( not ( = ?auto_22454 ?auto_22461 ) ) ( not ( = ?auto_22459 ?auto_22461 ) ) ( not ( = ?auto_22462 ?auto_22461 ) ) ( PERSON-AT ?auto_22457 ?auto_22461 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22457 ?auto_22455 ?auto_22454 )
      ( FLY-3PPL-VERIFY ?auto_22455 ?auto_22456 ?auto_22457 ?auto_22454 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_22521 - PERSON
      ?auto_22520 - CITY
    )
    :vars
    (
      ?auto_22525 - FLEVEL
      ?auto_22522 - FLEVEL
      ?auto_22524 - CITY
      ?auto_22529 - PERSON
      ?auto_22523 - PERSON
      ?auto_22527 - CITY
      ?auto_22528 - AIRCRAFT
      ?auto_22526 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22525 ?auto_22522 ) ( not ( = ?auto_22520 ?auto_22524 ) ) ( not ( = ?auto_22522 ?auto_22525 ) ) ( not ( = ?auto_22529 ?auto_22521 ) ) ( PERSON-AT ?auto_22521 ?auto_22524 ) ( not ( = ?auto_22529 ?auto_22523 ) ) ( not ( = ?auto_22521 ?auto_22523 ) ) ( not ( = ?auto_22520 ?auto_22527 ) ) ( not ( = ?auto_22524 ?auto_22527 ) ) ( PERSON-AT ?auto_22523 ?auto_22527 ) ( AIRCRAFT-AT ?auto_22528 ?auto_22526 ) ( not ( = ?auto_22520 ?auto_22526 ) ) ( not ( = ?auto_22524 ?auto_22526 ) ) ( not ( = ?auto_22527 ?auto_22526 ) ) ( PERSON-AT ?auto_22529 ?auto_22526 ) ( FUEL-LEVEL ?auto_22528 ?auto_22525 ) )
    :subtasks
    ( ( !REFUEL ?auto_22528 ?auto_22526 ?auto_22525 ?auto_22522 )
      ( FLY-2PPL ?auto_22529 ?auto_22521 ?auto_22520 )
      ( FLY-1PPL-VERIFY ?auto_22521 ?auto_22520 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22531 - PERSON
      ?auto_22532 - PERSON
      ?auto_22530 - CITY
    )
    :vars
    (
      ?auto_22538 - FLEVEL
      ?auto_22534 - FLEVEL
      ?auto_22539 - CITY
      ?auto_22536 - PERSON
      ?auto_22537 - CITY
      ?auto_22535 - AIRCRAFT
      ?auto_22533 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22538 ?auto_22534 ) ( not ( = ?auto_22530 ?auto_22539 ) ) ( not ( = ?auto_22534 ?auto_22538 ) ) ( not ( = ?auto_22531 ?auto_22532 ) ) ( PERSON-AT ?auto_22532 ?auto_22539 ) ( not ( = ?auto_22531 ?auto_22536 ) ) ( not ( = ?auto_22532 ?auto_22536 ) ) ( not ( = ?auto_22530 ?auto_22537 ) ) ( not ( = ?auto_22539 ?auto_22537 ) ) ( PERSON-AT ?auto_22536 ?auto_22537 ) ( AIRCRAFT-AT ?auto_22535 ?auto_22533 ) ( not ( = ?auto_22530 ?auto_22533 ) ) ( not ( = ?auto_22539 ?auto_22533 ) ) ( not ( = ?auto_22537 ?auto_22533 ) ) ( PERSON-AT ?auto_22531 ?auto_22533 ) ( FUEL-LEVEL ?auto_22535 ?auto_22538 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_22532 ?auto_22530 )
      ( FLY-2PPL-VERIFY ?auto_22531 ?auto_22532 ?auto_22530 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22541 - PERSON
      ?auto_22542 - PERSON
      ?auto_22540 - CITY
    )
    :vars
    (
      ?auto_22543 - FLEVEL
      ?auto_22547 - FLEVEL
      ?auto_22546 - CITY
      ?auto_22549 - PERSON
      ?auto_22545 - CITY
      ?auto_22548 - AIRCRAFT
      ?auto_22544 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22543 ?auto_22547 ) ( not ( = ?auto_22540 ?auto_22546 ) ) ( not ( = ?auto_22547 ?auto_22543 ) ) ( not ( = ?auto_22549 ?auto_22542 ) ) ( PERSON-AT ?auto_22542 ?auto_22546 ) ( not ( = ?auto_22549 ?auto_22541 ) ) ( not ( = ?auto_22542 ?auto_22541 ) ) ( not ( = ?auto_22540 ?auto_22545 ) ) ( not ( = ?auto_22546 ?auto_22545 ) ) ( PERSON-AT ?auto_22541 ?auto_22545 ) ( AIRCRAFT-AT ?auto_22548 ?auto_22544 ) ( not ( = ?auto_22540 ?auto_22544 ) ) ( not ( = ?auto_22546 ?auto_22544 ) ) ( not ( = ?auto_22545 ?auto_22544 ) ) ( PERSON-AT ?auto_22549 ?auto_22544 ) ( FUEL-LEVEL ?auto_22548 ?auto_22543 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22549 ?auto_22542 ?auto_22540 )
      ( FLY-2PPL-VERIFY ?auto_22541 ?auto_22542 ?auto_22540 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22551 - PERSON
      ?auto_22552 - PERSON
      ?auto_22550 - CITY
    )
    :vars
    (
      ?auto_22553 - FLEVEL
      ?auto_22557 - FLEVEL
      ?auto_22556 - CITY
      ?auto_22558 - PERSON
      ?auto_22555 - CITY
      ?auto_22559 - AIRCRAFT
      ?auto_22554 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22553 ?auto_22557 ) ( not ( = ?auto_22550 ?auto_22556 ) ) ( not ( = ?auto_22557 ?auto_22553 ) ) ( not ( = ?auto_22552 ?auto_22551 ) ) ( PERSON-AT ?auto_22551 ?auto_22556 ) ( not ( = ?auto_22552 ?auto_22558 ) ) ( not ( = ?auto_22551 ?auto_22558 ) ) ( not ( = ?auto_22550 ?auto_22555 ) ) ( not ( = ?auto_22556 ?auto_22555 ) ) ( PERSON-AT ?auto_22558 ?auto_22555 ) ( AIRCRAFT-AT ?auto_22559 ?auto_22554 ) ( not ( = ?auto_22550 ?auto_22554 ) ) ( not ( = ?auto_22556 ?auto_22554 ) ) ( not ( = ?auto_22555 ?auto_22554 ) ) ( PERSON-AT ?auto_22552 ?auto_22554 ) ( FUEL-LEVEL ?auto_22559 ?auto_22553 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22552 ?auto_22551 ?auto_22550 )
      ( FLY-2PPL-VERIFY ?auto_22551 ?auto_22552 ?auto_22550 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22561 - PERSON
      ?auto_22562 - PERSON
      ?auto_22560 - CITY
    )
    :vars
    (
      ?auto_22563 - FLEVEL
      ?auto_22567 - FLEVEL
      ?auto_22566 - CITY
      ?auto_22569 - PERSON
      ?auto_22565 - CITY
      ?auto_22568 - AIRCRAFT
      ?auto_22564 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22563 ?auto_22567 ) ( not ( = ?auto_22560 ?auto_22566 ) ) ( not ( = ?auto_22567 ?auto_22563 ) ) ( not ( = ?auto_22569 ?auto_22561 ) ) ( PERSON-AT ?auto_22561 ?auto_22566 ) ( not ( = ?auto_22569 ?auto_22562 ) ) ( not ( = ?auto_22561 ?auto_22562 ) ) ( not ( = ?auto_22560 ?auto_22565 ) ) ( not ( = ?auto_22566 ?auto_22565 ) ) ( PERSON-AT ?auto_22562 ?auto_22565 ) ( AIRCRAFT-AT ?auto_22568 ?auto_22564 ) ( not ( = ?auto_22560 ?auto_22564 ) ) ( not ( = ?auto_22566 ?auto_22564 ) ) ( not ( = ?auto_22565 ?auto_22564 ) ) ( PERSON-AT ?auto_22569 ?auto_22564 ) ( FUEL-LEVEL ?auto_22568 ?auto_22563 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22569 ?auto_22561 ?auto_22560 )
      ( FLY-2PPL-VERIFY ?auto_22561 ?auto_22562 ?auto_22560 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22593 - PERSON
      ?auto_22594 - PERSON
      ?auto_22595 - PERSON
      ?auto_22592 - CITY
    )
    :vars
    (
      ?auto_22596 - FLEVEL
      ?auto_22600 - FLEVEL
      ?auto_22599 - CITY
      ?auto_22598 - CITY
      ?auto_22601 - AIRCRAFT
      ?auto_22597 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22596 ?auto_22600 ) ( not ( = ?auto_22592 ?auto_22599 ) ) ( not ( = ?auto_22600 ?auto_22596 ) ) ( not ( = ?auto_22593 ?auto_22595 ) ) ( PERSON-AT ?auto_22595 ?auto_22599 ) ( not ( = ?auto_22593 ?auto_22594 ) ) ( not ( = ?auto_22595 ?auto_22594 ) ) ( not ( = ?auto_22592 ?auto_22598 ) ) ( not ( = ?auto_22599 ?auto_22598 ) ) ( PERSON-AT ?auto_22594 ?auto_22598 ) ( AIRCRAFT-AT ?auto_22601 ?auto_22597 ) ( not ( = ?auto_22592 ?auto_22597 ) ) ( not ( = ?auto_22599 ?auto_22597 ) ) ( not ( = ?auto_22598 ?auto_22597 ) ) ( PERSON-AT ?auto_22593 ?auto_22597 ) ( FUEL-LEVEL ?auto_22601 ?auto_22596 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22593 ?auto_22595 ?auto_22592 )
      ( FLY-3PPL-VERIFY ?auto_22593 ?auto_22594 ?auto_22595 ?auto_22592 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22614 - PERSON
      ?auto_22615 - PERSON
      ?auto_22616 - PERSON
      ?auto_22613 - CITY
    )
    :vars
    (
      ?auto_22617 - FLEVEL
      ?auto_22621 - FLEVEL
      ?auto_22620 - CITY
      ?auto_22619 - CITY
      ?auto_22622 - AIRCRAFT
      ?auto_22618 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22617 ?auto_22621 ) ( not ( = ?auto_22613 ?auto_22620 ) ) ( not ( = ?auto_22621 ?auto_22617 ) ) ( not ( = ?auto_22614 ?auto_22615 ) ) ( PERSON-AT ?auto_22615 ?auto_22620 ) ( not ( = ?auto_22614 ?auto_22616 ) ) ( not ( = ?auto_22615 ?auto_22616 ) ) ( not ( = ?auto_22613 ?auto_22619 ) ) ( not ( = ?auto_22620 ?auto_22619 ) ) ( PERSON-AT ?auto_22616 ?auto_22619 ) ( AIRCRAFT-AT ?auto_22622 ?auto_22618 ) ( not ( = ?auto_22613 ?auto_22618 ) ) ( not ( = ?auto_22620 ?auto_22618 ) ) ( not ( = ?auto_22619 ?auto_22618 ) ) ( PERSON-AT ?auto_22614 ?auto_22618 ) ( FUEL-LEVEL ?auto_22622 ?auto_22617 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22614 ?auto_22615 ?auto_22613 )
      ( FLY-3PPL-VERIFY ?auto_22614 ?auto_22615 ?auto_22616 ?auto_22613 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22635 - PERSON
      ?auto_22636 - PERSON
      ?auto_22637 - PERSON
      ?auto_22634 - CITY
    )
    :vars
    (
      ?auto_22638 - FLEVEL
      ?auto_22642 - FLEVEL
      ?auto_22641 - CITY
      ?auto_22640 - CITY
      ?auto_22643 - AIRCRAFT
      ?auto_22639 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22638 ?auto_22642 ) ( not ( = ?auto_22634 ?auto_22641 ) ) ( not ( = ?auto_22642 ?auto_22638 ) ) ( not ( = ?auto_22636 ?auto_22637 ) ) ( PERSON-AT ?auto_22637 ?auto_22641 ) ( not ( = ?auto_22636 ?auto_22635 ) ) ( not ( = ?auto_22637 ?auto_22635 ) ) ( not ( = ?auto_22634 ?auto_22640 ) ) ( not ( = ?auto_22641 ?auto_22640 ) ) ( PERSON-AT ?auto_22635 ?auto_22640 ) ( AIRCRAFT-AT ?auto_22643 ?auto_22639 ) ( not ( = ?auto_22634 ?auto_22639 ) ) ( not ( = ?auto_22641 ?auto_22639 ) ) ( not ( = ?auto_22640 ?auto_22639 ) ) ( PERSON-AT ?auto_22636 ?auto_22639 ) ( FUEL-LEVEL ?auto_22643 ?auto_22638 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22636 ?auto_22637 ?auto_22634 )
      ( FLY-3PPL-VERIFY ?auto_22635 ?auto_22636 ?auto_22637 ?auto_22634 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22656 - PERSON
      ?auto_22657 - PERSON
      ?auto_22658 - PERSON
      ?auto_22655 - CITY
    )
    :vars
    (
      ?auto_22659 - FLEVEL
      ?auto_22663 - FLEVEL
      ?auto_22662 - CITY
      ?auto_22661 - CITY
      ?auto_22664 - AIRCRAFT
      ?auto_22660 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22659 ?auto_22663 ) ( not ( = ?auto_22655 ?auto_22662 ) ) ( not ( = ?auto_22663 ?auto_22659 ) ) ( not ( = ?auto_22658 ?auto_22657 ) ) ( PERSON-AT ?auto_22657 ?auto_22662 ) ( not ( = ?auto_22658 ?auto_22656 ) ) ( not ( = ?auto_22657 ?auto_22656 ) ) ( not ( = ?auto_22655 ?auto_22661 ) ) ( not ( = ?auto_22662 ?auto_22661 ) ) ( PERSON-AT ?auto_22656 ?auto_22661 ) ( AIRCRAFT-AT ?auto_22664 ?auto_22660 ) ( not ( = ?auto_22655 ?auto_22660 ) ) ( not ( = ?auto_22662 ?auto_22660 ) ) ( not ( = ?auto_22661 ?auto_22660 ) ) ( PERSON-AT ?auto_22658 ?auto_22660 ) ( FUEL-LEVEL ?auto_22664 ?auto_22659 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22658 ?auto_22657 ?auto_22655 )
      ( FLY-3PPL-VERIFY ?auto_22656 ?auto_22657 ?auto_22658 ?auto_22655 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22699 - PERSON
      ?auto_22700 - PERSON
      ?auto_22701 - PERSON
      ?auto_22698 - CITY
    )
    :vars
    (
      ?auto_22702 - FLEVEL
      ?auto_22706 - FLEVEL
      ?auto_22705 - CITY
      ?auto_22704 - CITY
      ?auto_22707 - AIRCRAFT
      ?auto_22703 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22702 ?auto_22706 ) ( not ( = ?auto_22698 ?auto_22705 ) ) ( not ( = ?auto_22706 ?auto_22702 ) ) ( not ( = ?auto_22700 ?auto_22699 ) ) ( PERSON-AT ?auto_22699 ?auto_22705 ) ( not ( = ?auto_22700 ?auto_22701 ) ) ( not ( = ?auto_22699 ?auto_22701 ) ) ( not ( = ?auto_22698 ?auto_22704 ) ) ( not ( = ?auto_22705 ?auto_22704 ) ) ( PERSON-AT ?auto_22701 ?auto_22704 ) ( AIRCRAFT-AT ?auto_22707 ?auto_22703 ) ( not ( = ?auto_22698 ?auto_22703 ) ) ( not ( = ?auto_22705 ?auto_22703 ) ) ( not ( = ?auto_22704 ?auto_22703 ) ) ( PERSON-AT ?auto_22700 ?auto_22703 ) ( FUEL-LEVEL ?auto_22707 ?auto_22702 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22700 ?auto_22699 ?auto_22698 )
      ( FLY-3PPL-VERIFY ?auto_22699 ?auto_22700 ?auto_22701 ?auto_22698 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22720 - PERSON
      ?auto_22721 - PERSON
      ?auto_22722 - PERSON
      ?auto_22719 - CITY
    )
    :vars
    (
      ?auto_22723 - FLEVEL
      ?auto_22727 - FLEVEL
      ?auto_22726 - CITY
      ?auto_22725 - CITY
      ?auto_22728 - AIRCRAFT
      ?auto_22724 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_22723 ?auto_22727 ) ( not ( = ?auto_22719 ?auto_22726 ) ) ( not ( = ?auto_22727 ?auto_22723 ) ) ( not ( = ?auto_22722 ?auto_22720 ) ) ( PERSON-AT ?auto_22720 ?auto_22726 ) ( not ( = ?auto_22722 ?auto_22721 ) ) ( not ( = ?auto_22720 ?auto_22721 ) ) ( not ( = ?auto_22719 ?auto_22725 ) ) ( not ( = ?auto_22726 ?auto_22725 ) ) ( PERSON-AT ?auto_22721 ?auto_22725 ) ( AIRCRAFT-AT ?auto_22728 ?auto_22724 ) ( not ( = ?auto_22719 ?auto_22724 ) ) ( not ( = ?auto_22726 ?auto_22724 ) ) ( not ( = ?auto_22725 ?auto_22724 ) ) ( PERSON-AT ?auto_22722 ?auto_22724 ) ( FUEL-LEVEL ?auto_22728 ?auto_22723 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22722 ?auto_22720 ?auto_22719 )
      ( FLY-3PPL-VERIFY ?auto_22720 ?auto_22721 ?auto_22722 ?auto_22719 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_22786 - PERSON
      ?auto_22785 - CITY
    )
    :vars
    (
      ?auto_22787 - FLEVEL
      ?auto_22791 - FLEVEL
      ?auto_22790 - CITY
      ?auto_22794 - PERSON
      ?auto_22792 - PERSON
      ?auto_22789 - CITY
      ?auto_22788 - CITY
      ?auto_22793 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22787 ?auto_22791 ) ( not ( = ?auto_22785 ?auto_22790 ) ) ( not ( = ?auto_22791 ?auto_22787 ) ) ( not ( = ?auto_22794 ?auto_22786 ) ) ( PERSON-AT ?auto_22786 ?auto_22790 ) ( not ( = ?auto_22794 ?auto_22792 ) ) ( not ( = ?auto_22786 ?auto_22792 ) ) ( not ( = ?auto_22785 ?auto_22789 ) ) ( not ( = ?auto_22790 ?auto_22789 ) ) ( PERSON-AT ?auto_22792 ?auto_22789 ) ( not ( = ?auto_22785 ?auto_22788 ) ) ( not ( = ?auto_22790 ?auto_22788 ) ) ( not ( = ?auto_22789 ?auto_22788 ) ) ( PERSON-AT ?auto_22794 ?auto_22788 ) ( AIRCRAFT-AT ?auto_22793 ?auto_22785 ) ( FUEL-LEVEL ?auto_22793 ?auto_22791 ) )
    :subtasks
    ( ( !FLY ?auto_22793 ?auto_22785 ?auto_22788 ?auto_22791 ?auto_22787 )
      ( FLY-2PPL ?auto_22794 ?auto_22786 ?auto_22785 )
      ( FLY-1PPL-VERIFY ?auto_22786 ?auto_22785 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22796 - PERSON
      ?auto_22797 - PERSON
      ?auto_22795 - CITY
    )
    :vars
    (
      ?auto_22799 - FLEVEL
      ?auto_22798 - FLEVEL
      ?auto_22804 - CITY
      ?auto_22803 - PERSON
      ?auto_22802 - CITY
      ?auto_22801 - CITY
      ?auto_22800 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22799 ?auto_22798 ) ( not ( = ?auto_22795 ?auto_22804 ) ) ( not ( = ?auto_22798 ?auto_22799 ) ) ( not ( = ?auto_22796 ?auto_22797 ) ) ( PERSON-AT ?auto_22797 ?auto_22804 ) ( not ( = ?auto_22796 ?auto_22803 ) ) ( not ( = ?auto_22797 ?auto_22803 ) ) ( not ( = ?auto_22795 ?auto_22802 ) ) ( not ( = ?auto_22804 ?auto_22802 ) ) ( PERSON-AT ?auto_22803 ?auto_22802 ) ( not ( = ?auto_22795 ?auto_22801 ) ) ( not ( = ?auto_22804 ?auto_22801 ) ) ( not ( = ?auto_22802 ?auto_22801 ) ) ( PERSON-AT ?auto_22796 ?auto_22801 ) ( AIRCRAFT-AT ?auto_22800 ?auto_22795 ) ( FUEL-LEVEL ?auto_22800 ?auto_22798 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_22797 ?auto_22795 )
      ( FLY-2PPL-VERIFY ?auto_22796 ?auto_22797 ?auto_22795 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22806 - PERSON
      ?auto_22807 - PERSON
      ?auto_22805 - CITY
    )
    :vars
    (
      ?auto_22808 - FLEVEL
      ?auto_22813 - FLEVEL
      ?auto_22812 - CITY
      ?auto_22814 - PERSON
      ?auto_22811 - CITY
      ?auto_22810 - CITY
      ?auto_22809 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22808 ?auto_22813 ) ( not ( = ?auto_22805 ?auto_22812 ) ) ( not ( = ?auto_22813 ?auto_22808 ) ) ( not ( = ?auto_22814 ?auto_22807 ) ) ( PERSON-AT ?auto_22807 ?auto_22812 ) ( not ( = ?auto_22814 ?auto_22806 ) ) ( not ( = ?auto_22807 ?auto_22806 ) ) ( not ( = ?auto_22805 ?auto_22811 ) ) ( not ( = ?auto_22812 ?auto_22811 ) ) ( PERSON-AT ?auto_22806 ?auto_22811 ) ( not ( = ?auto_22805 ?auto_22810 ) ) ( not ( = ?auto_22812 ?auto_22810 ) ) ( not ( = ?auto_22811 ?auto_22810 ) ) ( PERSON-AT ?auto_22814 ?auto_22810 ) ( AIRCRAFT-AT ?auto_22809 ?auto_22805 ) ( FUEL-LEVEL ?auto_22809 ?auto_22813 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22814 ?auto_22807 ?auto_22805 )
      ( FLY-2PPL-VERIFY ?auto_22806 ?auto_22807 ?auto_22805 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22816 - PERSON
      ?auto_22817 - PERSON
      ?auto_22815 - CITY
    )
    :vars
    (
      ?auto_22818 - FLEVEL
      ?auto_22823 - FLEVEL
      ?auto_22822 - CITY
      ?auto_22824 - PERSON
      ?auto_22821 - CITY
      ?auto_22820 - CITY
      ?auto_22819 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22818 ?auto_22823 ) ( not ( = ?auto_22815 ?auto_22822 ) ) ( not ( = ?auto_22823 ?auto_22818 ) ) ( not ( = ?auto_22817 ?auto_22816 ) ) ( PERSON-AT ?auto_22816 ?auto_22822 ) ( not ( = ?auto_22817 ?auto_22824 ) ) ( not ( = ?auto_22816 ?auto_22824 ) ) ( not ( = ?auto_22815 ?auto_22821 ) ) ( not ( = ?auto_22822 ?auto_22821 ) ) ( PERSON-AT ?auto_22824 ?auto_22821 ) ( not ( = ?auto_22815 ?auto_22820 ) ) ( not ( = ?auto_22822 ?auto_22820 ) ) ( not ( = ?auto_22821 ?auto_22820 ) ) ( PERSON-AT ?auto_22817 ?auto_22820 ) ( AIRCRAFT-AT ?auto_22819 ?auto_22815 ) ( FUEL-LEVEL ?auto_22819 ?auto_22823 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22817 ?auto_22816 ?auto_22815 )
      ( FLY-2PPL-VERIFY ?auto_22816 ?auto_22817 ?auto_22815 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_22826 - PERSON
      ?auto_22827 - PERSON
      ?auto_22825 - CITY
    )
    :vars
    (
      ?auto_22828 - FLEVEL
      ?auto_22833 - FLEVEL
      ?auto_22832 - CITY
      ?auto_22834 - PERSON
      ?auto_22831 - CITY
      ?auto_22830 - CITY
      ?auto_22829 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22828 ?auto_22833 ) ( not ( = ?auto_22825 ?auto_22832 ) ) ( not ( = ?auto_22833 ?auto_22828 ) ) ( not ( = ?auto_22834 ?auto_22826 ) ) ( PERSON-AT ?auto_22826 ?auto_22832 ) ( not ( = ?auto_22834 ?auto_22827 ) ) ( not ( = ?auto_22826 ?auto_22827 ) ) ( not ( = ?auto_22825 ?auto_22831 ) ) ( not ( = ?auto_22832 ?auto_22831 ) ) ( PERSON-AT ?auto_22827 ?auto_22831 ) ( not ( = ?auto_22825 ?auto_22830 ) ) ( not ( = ?auto_22832 ?auto_22830 ) ) ( not ( = ?auto_22831 ?auto_22830 ) ) ( PERSON-AT ?auto_22834 ?auto_22830 ) ( AIRCRAFT-AT ?auto_22829 ?auto_22825 ) ( FUEL-LEVEL ?auto_22829 ?auto_22833 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22834 ?auto_22826 ?auto_22825 )
      ( FLY-2PPL-VERIFY ?auto_22826 ?auto_22827 ?auto_22825 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22858 - PERSON
      ?auto_22859 - PERSON
      ?auto_22860 - PERSON
      ?auto_22857 - CITY
    )
    :vars
    (
      ?auto_22861 - FLEVEL
      ?auto_22866 - FLEVEL
      ?auto_22865 - CITY
      ?auto_22864 - CITY
      ?auto_22863 - CITY
      ?auto_22862 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22861 ?auto_22866 ) ( not ( = ?auto_22857 ?auto_22865 ) ) ( not ( = ?auto_22866 ?auto_22861 ) ) ( not ( = ?auto_22858 ?auto_22860 ) ) ( PERSON-AT ?auto_22860 ?auto_22865 ) ( not ( = ?auto_22858 ?auto_22859 ) ) ( not ( = ?auto_22860 ?auto_22859 ) ) ( not ( = ?auto_22857 ?auto_22864 ) ) ( not ( = ?auto_22865 ?auto_22864 ) ) ( PERSON-AT ?auto_22859 ?auto_22864 ) ( not ( = ?auto_22857 ?auto_22863 ) ) ( not ( = ?auto_22865 ?auto_22863 ) ) ( not ( = ?auto_22864 ?auto_22863 ) ) ( PERSON-AT ?auto_22858 ?auto_22863 ) ( AIRCRAFT-AT ?auto_22862 ?auto_22857 ) ( FUEL-LEVEL ?auto_22862 ?auto_22866 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22858 ?auto_22860 ?auto_22857 )
      ( FLY-3PPL-VERIFY ?auto_22858 ?auto_22859 ?auto_22860 ?auto_22857 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22879 - PERSON
      ?auto_22880 - PERSON
      ?auto_22881 - PERSON
      ?auto_22878 - CITY
    )
    :vars
    (
      ?auto_22882 - FLEVEL
      ?auto_22887 - FLEVEL
      ?auto_22886 - CITY
      ?auto_22885 - CITY
      ?auto_22884 - CITY
      ?auto_22883 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22882 ?auto_22887 ) ( not ( = ?auto_22878 ?auto_22886 ) ) ( not ( = ?auto_22887 ?auto_22882 ) ) ( not ( = ?auto_22879 ?auto_22880 ) ) ( PERSON-AT ?auto_22880 ?auto_22886 ) ( not ( = ?auto_22879 ?auto_22881 ) ) ( not ( = ?auto_22880 ?auto_22881 ) ) ( not ( = ?auto_22878 ?auto_22885 ) ) ( not ( = ?auto_22886 ?auto_22885 ) ) ( PERSON-AT ?auto_22881 ?auto_22885 ) ( not ( = ?auto_22878 ?auto_22884 ) ) ( not ( = ?auto_22886 ?auto_22884 ) ) ( not ( = ?auto_22885 ?auto_22884 ) ) ( PERSON-AT ?auto_22879 ?auto_22884 ) ( AIRCRAFT-AT ?auto_22883 ?auto_22878 ) ( FUEL-LEVEL ?auto_22883 ?auto_22887 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22879 ?auto_22880 ?auto_22878 )
      ( FLY-3PPL-VERIFY ?auto_22879 ?auto_22880 ?auto_22881 ?auto_22878 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22900 - PERSON
      ?auto_22901 - PERSON
      ?auto_22902 - PERSON
      ?auto_22899 - CITY
    )
    :vars
    (
      ?auto_22903 - FLEVEL
      ?auto_22908 - FLEVEL
      ?auto_22907 - CITY
      ?auto_22906 - CITY
      ?auto_22905 - CITY
      ?auto_22904 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22903 ?auto_22908 ) ( not ( = ?auto_22899 ?auto_22907 ) ) ( not ( = ?auto_22908 ?auto_22903 ) ) ( not ( = ?auto_22901 ?auto_22902 ) ) ( PERSON-AT ?auto_22902 ?auto_22907 ) ( not ( = ?auto_22901 ?auto_22900 ) ) ( not ( = ?auto_22902 ?auto_22900 ) ) ( not ( = ?auto_22899 ?auto_22906 ) ) ( not ( = ?auto_22907 ?auto_22906 ) ) ( PERSON-AT ?auto_22900 ?auto_22906 ) ( not ( = ?auto_22899 ?auto_22905 ) ) ( not ( = ?auto_22907 ?auto_22905 ) ) ( not ( = ?auto_22906 ?auto_22905 ) ) ( PERSON-AT ?auto_22901 ?auto_22905 ) ( AIRCRAFT-AT ?auto_22904 ?auto_22899 ) ( FUEL-LEVEL ?auto_22904 ?auto_22908 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22901 ?auto_22902 ?auto_22899 )
      ( FLY-3PPL-VERIFY ?auto_22900 ?auto_22901 ?auto_22902 ?auto_22899 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22921 - PERSON
      ?auto_22922 - PERSON
      ?auto_22923 - PERSON
      ?auto_22920 - CITY
    )
    :vars
    (
      ?auto_22924 - FLEVEL
      ?auto_22929 - FLEVEL
      ?auto_22928 - CITY
      ?auto_22927 - CITY
      ?auto_22926 - CITY
      ?auto_22925 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22924 ?auto_22929 ) ( not ( = ?auto_22920 ?auto_22928 ) ) ( not ( = ?auto_22929 ?auto_22924 ) ) ( not ( = ?auto_22923 ?auto_22922 ) ) ( PERSON-AT ?auto_22922 ?auto_22928 ) ( not ( = ?auto_22923 ?auto_22921 ) ) ( not ( = ?auto_22922 ?auto_22921 ) ) ( not ( = ?auto_22920 ?auto_22927 ) ) ( not ( = ?auto_22928 ?auto_22927 ) ) ( PERSON-AT ?auto_22921 ?auto_22927 ) ( not ( = ?auto_22920 ?auto_22926 ) ) ( not ( = ?auto_22928 ?auto_22926 ) ) ( not ( = ?auto_22927 ?auto_22926 ) ) ( PERSON-AT ?auto_22923 ?auto_22926 ) ( AIRCRAFT-AT ?auto_22925 ?auto_22920 ) ( FUEL-LEVEL ?auto_22925 ?auto_22929 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22923 ?auto_22922 ?auto_22920 )
      ( FLY-3PPL-VERIFY ?auto_22921 ?auto_22922 ?auto_22923 ?auto_22920 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22964 - PERSON
      ?auto_22965 - PERSON
      ?auto_22966 - PERSON
      ?auto_22963 - CITY
    )
    :vars
    (
      ?auto_22967 - FLEVEL
      ?auto_22972 - FLEVEL
      ?auto_22971 - CITY
      ?auto_22970 - CITY
      ?auto_22969 - CITY
      ?auto_22968 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22967 ?auto_22972 ) ( not ( = ?auto_22963 ?auto_22971 ) ) ( not ( = ?auto_22972 ?auto_22967 ) ) ( not ( = ?auto_22965 ?auto_22964 ) ) ( PERSON-AT ?auto_22964 ?auto_22971 ) ( not ( = ?auto_22965 ?auto_22966 ) ) ( not ( = ?auto_22964 ?auto_22966 ) ) ( not ( = ?auto_22963 ?auto_22970 ) ) ( not ( = ?auto_22971 ?auto_22970 ) ) ( PERSON-AT ?auto_22966 ?auto_22970 ) ( not ( = ?auto_22963 ?auto_22969 ) ) ( not ( = ?auto_22971 ?auto_22969 ) ) ( not ( = ?auto_22970 ?auto_22969 ) ) ( PERSON-AT ?auto_22965 ?auto_22969 ) ( AIRCRAFT-AT ?auto_22968 ?auto_22963 ) ( FUEL-LEVEL ?auto_22968 ?auto_22972 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22965 ?auto_22964 ?auto_22963 )
      ( FLY-3PPL-VERIFY ?auto_22964 ?auto_22965 ?auto_22966 ?auto_22963 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22985 - PERSON
      ?auto_22986 - PERSON
      ?auto_22987 - PERSON
      ?auto_22984 - CITY
    )
    :vars
    (
      ?auto_22988 - FLEVEL
      ?auto_22993 - FLEVEL
      ?auto_22992 - CITY
      ?auto_22991 - CITY
      ?auto_22990 - CITY
      ?auto_22989 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22988 ?auto_22993 ) ( not ( = ?auto_22984 ?auto_22992 ) ) ( not ( = ?auto_22993 ?auto_22988 ) ) ( not ( = ?auto_22987 ?auto_22985 ) ) ( PERSON-AT ?auto_22985 ?auto_22992 ) ( not ( = ?auto_22987 ?auto_22986 ) ) ( not ( = ?auto_22985 ?auto_22986 ) ) ( not ( = ?auto_22984 ?auto_22991 ) ) ( not ( = ?auto_22992 ?auto_22991 ) ) ( PERSON-AT ?auto_22986 ?auto_22991 ) ( not ( = ?auto_22984 ?auto_22990 ) ) ( not ( = ?auto_22992 ?auto_22990 ) ) ( not ( = ?auto_22991 ?auto_22990 ) ) ( PERSON-AT ?auto_22987 ?auto_22990 ) ( AIRCRAFT-AT ?auto_22989 ?auto_22984 ) ( FUEL-LEVEL ?auto_22989 ?auto_22993 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22987 ?auto_22985 ?auto_22984 )
      ( FLY-3PPL-VERIFY ?auto_22985 ?auto_22986 ?auto_22987 ?auto_22984 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23051 - PERSON
      ?auto_23050 - CITY
    )
    :vars
    (
      ?auto_23052 - FLEVEL
      ?auto_23057 - FLEVEL
      ?auto_23056 - CITY
      ?auto_23059 - PERSON
      ?auto_23058 - PERSON
      ?auto_23055 - CITY
      ?auto_23054 - CITY
      ?auto_23053 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23052 ?auto_23057 ) ( not ( = ?auto_23050 ?auto_23056 ) ) ( not ( = ?auto_23057 ?auto_23052 ) ) ( not ( = ?auto_23059 ?auto_23051 ) ) ( PERSON-AT ?auto_23051 ?auto_23056 ) ( not ( = ?auto_23059 ?auto_23058 ) ) ( not ( = ?auto_23051 ?auto_23058 ) ) ( not ( = ?auto_23050 ?auto_23055 ) ) ( not ( = ?auto_23056 ?auto_23055 ) ) ( PERSON-AT ?auto_23058 ?auto_23055 ) ( not ( = ?auto_23050 ?auto_23054 ) ) ( not ( = ?auto_23056 ?auto_23054 ) ) ( not ( = ?auto_23055 ?auto_23054 ) ) ( PERSON-AT ?auto_23059 ?auto_23054 ) ( AIRCRAFT-AT ?auto_23053 ?auto_23050 ) ( FUEL-LEVEL ?auto_23053 ?auto_23052 ) )
    :subtasks
    ( ( !REFUEL ?auto_23053 ?auto_23050 ?auto_23052 ?auto_23057 )
      ( FLY-2PPL ?auto_23059 ?auto_23051 ?auto_23050 )
      ( FLY-1PPL-VERIFY ?auto_23051 ?auto_23050 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23061 - PERSON
      ?auto_23062 - PERSON
      ?auto_23060 - CITY
    )
    :vars
    (
      ?auto_23065 - FLEVEL
      ?auto_23066 - FLEVEL
      ?auto_23067 - CITY
      ?auto_23069 - PERSON
      ?auto_23064 - CITY
      ?auto_23068 - CITY
      ?auto_23063 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23065 ?auto_23066 ) ( not ( = ?auto_23060 ?auto_23067 ) ) ( not ( = ?auto_23066 ?auto_23065 ) ) ( not ( = ?auto_23061 ?auto_23062 ) ) ( PERSON-AT ?auto_23062 ?auto_23067 ) ( not ( = ?auto_23061 ?auto_23069 ) ) ( not ( = ?auto_23062 ?auto_23069 ) ) ( not ( = ?auto_23060 ?auto_23064 ) ) ( not ( = ?auto_23067 ?auto_23064 ) ) ( PERSON-AT ?auto_23069 ?auto_23064 ) ( not ( = ?auto_23060 ?auto_23068 ) ) ( not ( = ?auto_23067 ?auto_23068 ) ) ( not ( = ?auto_23064 ?auto_23068 ) ) ( PERSON-AT ?auto_23061 ?auto_23068 ) ( AIRCRAFT-AT ?auto_23063 ?auto_23060 ) ( FUEL-LEVEL ?auto_23063 ?auto_23065 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23062 ?auto_23060 )
      ( FLY-2PPL-VERIFY ?auto_23061 ?auto_23062 ?auto_23060 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23071 - PERSON
      ?auto_23072 - PERSON
      ?auto_23070 - CITY
    )
    :vars
    (
      ?auto_23077 - FLEVEL
      ?auto_23078 - FLEVEL
      ?auto_23076 - CITY
      ?auto_23079 - PERSON
      ?auto_23074 - CITY
      ?auto_23073 - CITY
      ?auto_23075 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23077 ?auto_23078 ) ( not ( = ?auto_23070 ?auto_23076 ) ) ( not ( = ?auto_23078 ?auto_23077 ) ) ( not ( = ?auto_23079 ?auto_23072 ) ) ( PERSON-AT ?auto_23072 ?auto_23076 ) ( not ( = ?auto_23079 ?auto_23071 ) ) ( not ( = ?auto_23072 ?auto_23071 ) ) ( not ( = ?auto_23070 ?auto_23074 ) ) ( not ( = ?auto_23076 ?auto_23074 ) ) ( PERSON-AT ?auto_23071 ?auto_23074 ) ( not ( = ?auto_23070 ?auto_23073 ) ) ( not ( = ?auto_23076 ?auto_23073 ) ) ( not ( = ?auto_23074 ?auto_23073 ) ) ( PERSON-AT ?auto_23079 ?auto_23073 ) ( AIRCRAFT-AT ?auto_23075 ?auto_23070 ) ( FUEL-LEVEL ?auto_23075 ?auto_23077 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23079 ?auto_23072 ?auto_23070 )
      ( FLY-2PPL-VERIFY ?auto_23071 ?auto_23072 ?auto_23070 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23081 - PERSON
      ?auto_23082 - PERSON
      ?auto_23080 - CITY
    )
    :vars
    (
      ?auto_23088 - FLEVEL
      ?auto_23089 - FLEVEL
      ?auto_23087 - CITY
      ?auto_23083 - PERSON
      ?auto_23085 - CITY
      ?auto_23084 - CITY
      ?auto_23086 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23088 ?auto_23089 ) ( not ( = ?auto_23080 ?auto_23087 ) ) ( not ( = ?auto_23089 ?auto_23088 ) ) ( not ( = ?auto_23082 ?auto_23081 ) ) ( PERSON-AT ?auto_23081 ?auto_23087 ) ( not ( = ?auto_23082 ?auto_23083 ) ) ( not ( = ?auto_23081 ?auto_23083 ) ) ( not ( = ?auto_23080 ?auto_23085 ) ) ( not ( = ?auto_23087 ?auto_23085 ) ) ( PERSON-AT ?auto_23083 ?auto_23085 ) ( not ( = ?auto_23080 ?auto_23084 ) ) ( not ( = ?auto_23087 ?auto_23084 ) ) ( not ( = ?auto_23085 ?auto_23084 ) ) ( PERSON-AT ?auto_23082 ?auto_23084 ) ( AIRCRAFT-AT ?auto_23086 ?auto_23080 ) ( FUEL-LEVEL ?auto_23086 ?auto_23088 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23082 ?auto_23081 ?auto_23080 )
      ( FLY-2PPL-VERIFY ?auto_23081 ?auto_23082 ?auto_23080 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23091 - PERSON
      ?auto_23092 - PERSON
      ?auto_23090 - CITY
    )
    :vars
    (
      ?auto_23097 - FLEVEL
      ?auto_23098 - FLEVEL
      ?auto_23096 - CITY
      ?auto_23099 - PERSON
      ?auto_23094 - CITY
      ?auto_23093 - CITY
      ?auto_23095 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23097 ?auto_23098 ) ( not ( = ?auto_23090 ?auto_23096 ) ) ( not ( = ?auto_23098 ?auto_23097 ) ) ( not ( = ?auto_23099 ?auto_23091 ) ) ( PERSON-AT ?auto_23091 ?auto_23096 ) ( not ( = ?auto_23099 ?auto_23092 ) ) ( not ( = ?auto_23091 ?auto_23092 ) ) ( not ( = ?auto_23090 ?auto_23094 ) ) ( not ( = ?auto_23096 ?auto_23094 ) ) ( PERSON-AT ?auto_23092 ?auto_23094 ) ( not ( = ?auto_23090 ?auto_23093 ) ) ( not ( = ?auto_23096 ?auto_23093 ) ) ( not ( = ?auto_23094 ?auto_23093 ) ) ( PERSON-AT ?auto_23099 ?auto_23093 ) ( AIRCRAFT-AT ?auto_23095 ?auto_23090 ) ( FUEL-LEVEL ?auto_23095 ?auto_23097 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23099 ?auto_23091 ?auto_23090 )
      ( FLY-2PPL-VERIFY ?auto_23091 ?auto_23092 ?auto_23090 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23123 - PERSON
      ?auto_23124 - PERSON
      ?auto_23125 - PERSON
      ?auto_23122 - CITY
    )
    :vars
    (
      ?auto_23130 - FLEVEL
      ?auto_23131 - FLEVEL
      ?auto_23129 - CITY
      ?auto_23127 - CITY
      ?auto_23126 - CITY
      ?auto_23128 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23130 ?auto_23131 ) ( not ( = ?auto_23122 ?auto_23129 ) ) ( not ( = ?auto_23131 ?auto_23130 ) ) ( not ( = ?auto_23123 ?auto_23125 ) ) ( PERSON-AT ?auto_23125 ?auto_23129 ) ( not ( = ?auto_23123 ?auto_23124 ) ) ( not ( = ?auto_23125 ?auto_23124 ) ) ( not ( = ?auto_23122 ?auto_23127 ) ) ( not ( = ?auto_23129 ?auto_23127 ) ) ( PERSON-AT ?auto_23124 ?auto_23127 ) ( not ( = ?auto_23122 ?auto_23126 ) ) ( not ( = ?auto_23129 ?auto_23126 ) ) ( not ( = ?auto_23127 ?auto_23126 ) ) ( PERSON-AT ?auto_23123 ?auto_23126 ) ( AIRCRAFT-AT ?auto_23128 ?auto_23122 ) ( FUEL-LEVEL ?auto_23128 ?auto_23130 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23123 ?auto_23125 ?auto_23122 )
      ( FLY-3PPL-VERIFY ?auto_23123 ?auto_23124 ?auto_23125 ?auto_23122 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23144 - PERSON
      ?auto_23145 - PERSON
      ?auto_23146 - PERSON
      ?auto_23143 - CITY
    )
    :vars
    (
      ?auto_23151 - FLEVEL
      ?auto_23152 - FLEVEL
      ?auto_23150 - CITY
      ?auto_23148 - CITY
      ?auto_23147 - CITY
      ?auto_23149 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23151 ?auto_23152 ) ( not ( = ?auto_23143 ?auto_23150 ) ) ( not ( = ?auto_23152 ?auto_23151 ) ) ( not ( = ?auto_23144 ?auto_23145 ) ) ( PERSON-AT ?auto_23145 ?auto_23150 ) ( not ( = ?auto_23144 ?auto_23146 ) ) ( not ( = ?auto_23145 ?auto_23146 ) ) ( not ( = ?auto_23143 ?auto_23148 ) ) ( not ( = ?auto_23150 ?auto_23148 ) ) ( PERSON-AT ?auto_23146 ?auto_23148 ) ( not ( = ?auto_23143 ?auto_23147 ) ) ( not ( = ?auto_23150 ?auto_23147 ) ) ( not ( = ?auto_23148 ?auto_23147 ) ) ( PERSON-AT ?auto_23144 ?auto_23147 ) ( AIRCRAFT-AT ?auto_23149 ?auto_23143 ) ( FUEL-LEVEL ?auto_23149 ?auto_23151 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23144 ?auto_23145 ?auto_23143 )
      ( FLY-3PPL-VERIFY ?auto_23144 ?auto_23145 ?auto_23146 ?auto_23143 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23165 - PERSON
      ?auto_23166 - PERSON
      ?auto_23167 - PERSON
      ?auto_23164 - CITY
    )
    :vars
    (
      ?auto_23172 - FLEVEL
      ?auto_23173 - FLEVEL
      ?auto_23171 - CITY
      ?auto_23169 - CITY
      ?auto_23168 - CITY
      ?auto_23170 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23172 ?auto_23173 ) ( not ( = ?auto_23164 ?auto_23171 ) ) ( not ( = ?auto_23173 ?auto_23172 ) ) ( not ( = ?auto_23166 ?auto_23167 ) ) ( PERSON-AT ?auto_23167 ?auto_23171 ) ( not ( = ?auto_23166 ?auto_23165 ) ) ( not ( = ?auto_23167 ?auto_23165 ) ) ( not ( = ?auto_23164 ?auto_23169 ) ) ( not ( = ?auto_23171 ?auto_23169 ) ) ( PERSON-AT ?auto_23165 ?auto_23169 ) ( not ( = ?auto_23164 ?auto_23168 ) ) ( not ( = ?auto_23171 ?auto_23168 ) ) ( not ( = ?auto_23169 ?auto_23168 ) ) ( PERSON-AT ?auto_23166 ?auto_23168 ) ( AIRCRAFT-AT ?auto_23170 ?auto_23164 ) ( FUEL-LEVEL ?auto_23170 ?auto_23172 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23166 ?auto_23167 ?auto_23164 )
      ( FLY-3PPL-VERIFY ?auto_23165 ?auto_23166 ?auto_23167 ?auto_23164 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23186 - PERSON
      ?auto_23187 - PERSON
      ?auto_23188 - PERSON
      ?auto_23185 - CITY
    )
    :vars
    (
      ?auto_23193 - FLEVEL
      ?auto_23194 - FLEVEL
      ?auto_23192 - CITY
      ?auto_23190 - CITY
      ?auto_23189 - CITY
      ?auto_23191 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23193 ?auto_23194 ) ( not ( = ?auto_23185 ?auto_23192 ) ) ( not ( = ?auto_23194 ?auto_23193 ) ) ( not ( = ?auto_23188 ?auto_23187 ) ) ( PERSON-AT ?auto_23187 ?auto_23192 ) ( not ( = ?auto_23188 ?auto_23186 ) ) ( not ( = ?auto_23187 ?auto_23186 ) ) ( not ( = ?auto_23185 ?auto_23190 ) ) ( not ( = ?auto_23192 ?auto_23190 ) ) ( PERSON-AT ?auto_23186 ?auto_23190 ) ( not ( = ?auto_23185 ?auto_23189 ) ) ( not ( = ?auto_23192 ?auto_23189 ) ) ( not ( = ?auto_23190 ?auto_23189 ) ) ( PERSON-AT ?auto_23188 ?auto_23189 ) ( AIRCRAFT-AT ?auto_23191 ?auto_23185 ) ( FUEL-LEVEL ?auto_23191 ?auto_23193 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23188 ?auto_23187 ?auto_23185 )
      ( FLY-3PPL-VERIFY ?auto_23186 ?auto_23187 ?auto_23188 ?auto_23185 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23229 - PERSON
      ?auto_23230 - PERSON
      ?auto_23231 - PERSON
      ?auto_23228 - CITY
    )
    :vars
    (
      ?auto_23236 - FLEVEL
      ?auto_23237 - FLEVEL
      ?auto_23235 - CITY
      ?auto_23233 - CITY
      ?auto_23232 - CITY
      ?auto_23234 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23236 ?auto_23237 ) ( not ( = ?auto_23228 ?auto_23235 ) ) ( not ( = ?auto_23237 ?auto_23236 ) ) ( not ( = ?auto_23230 ?auto_23229 ) ) ( PERSON-AT ?auto_23229 ?auto_23235 ) ( not ( = ?auto_23230 ?auto_23231 ) ) ( not ( = ?auto_23229 ?auto_23231 ) ) ( not ( = ?auto_23228 ?auto_23233 ) ) ( not ( = ?auto_23235 ?auto_23233 ) ) ( PERSON-AT ?auto_23231 ?auto_23233 ) ( not ( = ?auto_23228 ?auto_23232 ) ) ( not ( = ?auto_23235 ?auto_23232 ) ) ( not ( = ?auto_23233 ?auto_23232 ) ) ( PERSON-AT ?auto_23230 ?auto_23232 ) ( AIRCRAFT-AT ?auto_23234 ?auto_23228 ) ( FUEL-LEVEL ?auto_23234 ?auto_23236 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23230 ?auto_23229 ?auto_23228 )
      ( FLY-3PPL-VERIFY ?auto_23229 ?auto_23230 ?auto_23231 ?auto_23228 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23250 - PERSON
      ?auto_23251 - PERSON
      ?auto_23252 - PERSON
      ?auto_23249 - CITY
    )
    :vars
    (
      ?auto_23257 - FLEVEL
      ?auto_23258 - FLEVEL
      ?auto_23256 - CITY
      ?auto_23254 - CITY
      ?auto_23253 - CITY
      ?auto_23255 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23257 ?auto_23258 ) ( not ( = ?auto_23249 ?auto_23256 ) ) ( not ( = ?auto_23258 ?auto_23257 ) ) ( not ( = ?auto_23252 ?auto_23250 ) ) ( PERSON-AT ?auto_23250 ?auto_23256 ) ( not ( = ?auto_23252 ?auto_23251 ) ) ( not ( = ?auto_23250 ?auto_23251 ) ) ( not ( = ?auto_23249 ?auto_23254 ) ) ( not ( = ?auto_23256 ?auto_23254 ) ) ( PERSON-AT ?auto_23251 ?auto_23254 ) ( not ( = ?auto_23249 ?auto_23253 ) ) ( not ( = ?auto_23256 ?auto_23253 ) ) ( not ( = ?auto_23254 ?auto_23253 ) ) ( PERSON-AT ?auto_23252 ?auto_23253 ) ( AIRCRAFT-AT ?auto_23255 ?auto_23249 ) ( FUEL-LEVEL ?auto_23255 ?auto_23257 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23252 ?auto_23250 ?auto_23249 )
      ( FLY-3PPL-VERIFY ?auto_23250 ?auto_23251 ?auto_23252 ?auto_23249 ) )
  )

)

