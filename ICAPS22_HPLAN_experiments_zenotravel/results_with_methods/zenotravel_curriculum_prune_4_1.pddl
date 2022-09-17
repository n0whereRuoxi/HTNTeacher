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

  ( :method FLY-4PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?p4 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) ( PERSON-AT ?p4 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_4751 - PERSON
      ?auto_4750 - CITY
    )
    :vars
    (
      ?auto_4754 - FLEVEL
      ?auto_4753 - FLEVEL
      ?auto_4755 - CITY
      ?auto_4752 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4754 ?auto_4753 ) ( PERSON-AT ?auto_4751 ?auto_4755 ) ( AIRCRAFT-AT ?auto_4752 ?auto_4750 ) ( FUEL-LEVEL ?auto_4752 ?auto_4754 ) ( not ( = ?auto_4750 ?auto_4755 ) ) ( not ( = ?auto_4754 ?auto_4753 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_4752 ?auto_4750 ?auto_4754 ?auto_4753 )
      ( !FLY ?auto_4752 ?auto_4750 ?auto_4755 ?auto_4753 ?auto_4754 )
      ( !REFUEL ?auto_4752 ?auto_4755 ?auto_4754 ?auto_4753 )
      ( !BOARD ?auto_4751 ?auto_4752 ?auto_4755 )
      ( !FLY ?auto_4752 ?auto_4755 ?auto_4750 ?auto_4753 ?auto_4754 )
      ( !DEBARK ?auto_4751 ?auto_4752 ?auto_4750 )
      ( FLY-1PPL-VERIFY ?auto_4751 ?auto_4750 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4774 - PERSON
      ?auto_4775 - PERSON
      ?auto_4773 - CITY
    )
    :vars
    (
      ?auto_4776 - FLEVEL
      ?auto_4777 - FLEVEL
      ?auto_4779 - CITY
      ?auto_4778 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4776 ?auto_4777 ) ( PERSON-AT ?auto_4775 ?auto_4779 ) ( not ( = ?auto_4773 ?auto_4779 ) ) ( not ( = ?auto_4776 ?auto_4777 ) ) ( PERSON-AT ?auto_4774 ?auto_4779 ) ( AIRCRAFT-AT ?auto_4778 ?auto_4773 ) ( FUEL-LEVEL ?auto_4778 ?auto_4776 ) ( not ( = ?auto_4774 ?auto_4775 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_4774 ?auto_4773 )
      ( FLY-1PPL ?auto_4775 ?auto_4773 )
      ( FLY-2PPL-VERIFY ?auto_4774 ?auto_4775 ?auto_4773 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4886 - PERSON
      ?auto_4887 - PERSON
      ?auto_4888 - PERSON
      ?auto_4885 - CITY
    )
    :vars
    (
      ?auto_4890 - FLEVEL
      ?auto_4892 - FLEVEL
      ?auto_4891 - CITY
      ?auto_4893 - CITY
      ?auto_4889 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4890 ?auto_4892 ) ( PERSON-AT ?auto_4888 ?auto_4891 ) ( not ( = ?auto_4885 ?auto_4891 ) ) ( not ( = ?auto_4890 ?auto_4892 ) ) ( PERSON-AT ?auto_4887 ?auto_4893 ) ( not ( = ?auto_4885 ?auto_4893 ) ) ( PERSON-AT ?auto_4886 ?auto_4893 ) ( AIRCRAFT-AT ?auto_4889 ?auto_4885 ) ( FUEL-LEVEL ?auto_4889 ?auto_4890 ) ( not ( = ?auto_4886 ?auto_4887 ) ) ( not ( = ?auto_4886 ?auto_4888 ) ) ( not ( = ?auto_4887 ?auto_4888 ) ) ( not ( = ?auto_4891 ?auto_4893 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4886 ?auto_4887 ?auto_4885 )
      ( FLY-1PPL ?auto_4888 ?auto_4885 )
      ( FLY-3PPL-VERIFY ?auto_4886 ?auto_4887 ?auto_4888 ?auto_4885 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4905 - PERSON
      ?auto_4906 - PERSON
      ?auto_4907 - PERSON
      ?auto_4904 - CITY
    )
    :vars
    (
      ?auto_4911 - FLEVEL
      ?auto_4908 - FLEVEL
      ?auto_4910 - CITY
      ?auto_4912 - CITY
      ?auto_4909 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4911 ?auto_4908 ) ( PERSON-AT ?auto_4906 ?auto_4910 ) ( not ( = ?auto_4904 ?auto_4910 ) ) ( not ( = ?auto_4911 ?auto_4908 ) ) ( PERSON-AT ?auto_4907 ?auto_4912 ) ( not ( = ?auto_4904 ?auto_4912 ) ) ( PERSON-AT ?auto_4905 ?auto_4912 ) ( AIRCRAFT-AT ?auto_4909 ?auto_4904 ) ( FUEL-LEVEL ?auto_4909 ?auto_4911 ) ( not ( = ?auto_4905 ?auto_4907 ) ) ( not ( = ?auto_4905 ?auto_4906 ) ) ( not ( = ?auto_4907 ?auto_4906 ) ) ( not ( = ?auto_4910 ?auto_4912 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_4905 ?auto_4907 ?auto_4906 ?auto_4904 )
      ( FLY-3PPL-VERIFY ?auto_4905 ?auto_4906 ?auto_4907 ?auto_4904 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4972 - PERSON
      ?auto_4973 - PERSON
      ?auto_4974 - PERSON
      ?auto_4971 - CITY
    )
    :vars
    (
      ?auto_4975 - FLEVEL
      ?auto_4978 - FLEVEL
      ?auto_4976 - CITY
      ?auto_4979 - CITY
      ?auto_4977 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4975 ?auto_4978 ) ( PERSON-AT ?auto_4972 ?auto_4976 ) ( not ( = ?auto_4971 ?auto_4976 ) ) ( not ( = ?auto_4975 ?auto_4978 ) ) ( PERSON-AT ?auto_4974 ?auto_4979 ) ( not ( = ?auto_4971 ?auto_4979 ) ) ( PERSON-AT ?auto_4973 ?auto_4979 ) ( AIRCRAFT-AT ?auto_4977 ?auto_4971 ) ( FUEL-LEVEL ?auto_4977 ?auto_4975 ) ( not ( = ?auto_4973 ?auto_4974 ) ) ( not ( = ?auto_4973 ?auto_4972 ) ) ( not ( = ?auto_4974 ?auto_4972 ) ) ( not ( = ?auto_4976 ?auto_4979 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_4973 ?auto_4972 ?auto_4974 ?auto_4971 )
      ( FLY-3PPL-VERIFY ?auto_4972 ?auto_4973 ?auto_4974 ?auto_4971 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6040 - PERSON
      ?auto_6041 - PERSON
      ?auto_6042 - PERSON
      ?auto_6043 - PERSON
      ?auto_6039 - CITY
    )
    :vars
    (
      ?auto_6045 - FLEVEL
      ?auto_6046 - FLEVEL
      ?auto_6044 - CITY
      ?auto_6048 - CITY
      ?auto_6049 - CITY
      ?auto_6047 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6045 ?auto_6046 ) ( PERSON-AT ?auto_6043 ?auto_6044 ) ( not ( = ?auto_6039 ?auto_6044 ) ) ( not ( = ?auto_6045 ?auto_6046 ) ) ( PERSON-AT ?auto_6042 ?auto_6048 ) ( not ( = ?auto_6039 ?auto_6048 ) ) ( PERSON-AT ?auto_6041 ?auto_6049 ) ( not ( = ?auto_6039 ?auto_6049 ) ) ( PERSON-AT ?auto_6040 ?auto_6049 ) ( AIRCRAFT-AT ?auto_6047 ?auto_6039 ) ( FUEL-LEVEL ?auto_6047 ?auto_6045 ) ( not ( = ?auto_6040 ?auto_6041 ) ) ( not ( = ?auto_6040 ?auto_6042 ) ) ( not ( = ?auto_6041 ?auto_6042 ) ) ( not ( = ?auto_6048 ?auto_6049 ) ) ( not ( = ?auto_6040 ?auto_6043 ) ) ( not ( = ?auto_6041 ?auto_6043 ) ) ( not ( = ?auto_6042 ?auto_6043 ) ) ( not ( = ?auto_6044 ?auto_6048 ) ) ( not ( = ?auto_6044 ?auto_6049 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_6040 ?auto_6042 ?auto_6041 ?auto_6039 )
      ( FLY-1PPL ?auto_6043 ?auto_6039 )
      ( FLY-4PPL-VERIFY ?auto_6040 ?auto_6041 ?auto_6042 ?auto_6043 ?auto_6039 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6104 - PERSON
      ?auto_6105 - PERSON
      ?auto_6106 - PERSON
      ?auto_6107 - PERSON
      ?auto_6103 - CITY
    )
    :vars
    (
      ?auto_6110 - FLEVEL
      ?auto_6111 - FLEVEL
      ?auto_6109 - CITY
      ?auto_6113 - CITY
      ?auto_6108 - CITY
      ?auto_6112 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6110 ?auto_6111 ) ( PERSON-AT ?auto_6107 ?auto_6109 ) ( not ( = ?auto_6103 ?auto_6109 ) ) ( not ( = ?auto_6110 ?auto_6111 ) ) ( PERSON-AT ?auto_6105 ?auto_6113 ) ( not ( = ?auto_6103 ?auto_6113 ) ) ( PERSON-AT ?auto_6106 ?auto_6108 ) ( not ( = ?auto_6103 ?auto_6108 ) ) ( PERSON-AT ?auto_6104 ?auto_6108 ) ( AIRCRAFT-AT ?auto_6112 ?auto_6103 ) ( FUEL-LEVEL ?auto_6112 ?auto_6110 ) ( not ( = ?auto_6104 ?auto_6106 ) ) ( not ( = ?auto_6104 ?auto_6105 ) ) ( not ( = ?auto_6106 ?auto_6105 ) ) ( not ( = ?auto_6113 ?auto_6108 ) ) ( not ( = ?auto_6104 ?auto_6107 ) ) ( not ( = ?auto_6106 ?auto_6107 ) ) ( not ( = ?auto_6105 ?auto_6107 ) ) ( not ( = ?auto_6109 ?auto_6113 ) ) ( not ( = ?auto_6109 ?auto_6108 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6104 ?auto_6106 ?auto_6105 ?auto_6107 ?auto_6103 )
      ( FLY-4PPL-VERIFY ?auto_6104 ?auto_6105 ?auto_6106 ?auto_6107 ?auto_6103 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6139 - PERSON
      ?auto_6140 - PERSON
      ?auto_6141 - PERSON
      ?auto_6142 - PERSON
      ?auto_6138 - CITY
    )
    :vars
    (
      ?auto_6148 - FLEVEL
      ?auto_6147 - FLEVEL
      ?auto_6145 - CITY
      ?auto_6146 - CITY
      ?auto_6144 - CITY
      ?auto_6143 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6148 ?auto_6147 ) ( PERSON-AT ?auto_6141 ?auto_6145 ) ( not ( = ?auto_6138 ?auto_6145 ) ) ( not ( = ?auto_6148 ?auto_6147 ) ) ( PERSON-AT ?auto_6140 ?auto_6146 ) ( not ( = ?auto_6138 ?auto_6146 ) ) ( PERSON-AT ?auto_6142 ?auto_6144 ) ( not ( = ?auto_6138 ?auto_6144 ) ) ( PERSON-AT ?auto_6139 ?auto_6144 ) ( AIRCRAFT-AT ?auto_6143 ?auto_6138 ) ( FUEL-LEVEL ?auto_6143 ?auto_6148 ) ( not ( = ?auto_6139 ?auto_6142 ) ) ( not ( = ?auto_6139 ?auto_6140 ) ) ( not ( = ?auto_6142 ?auto_6140 ) ) ( not ( = ?auto_6146 ?auto_6144 ) ) ( not ( = ?auto_6139 ?auto_6141 ) ) ( not ( = ?auto_6142 ?auto_6141 ) ) ( not ( = ?auto_6140 ?auto_6141 ) ) ( not ( = ?auto_6145 ?auto_6146 ) ) ( not ( = ?auto_6145 ?auto_6144 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6139 ?auto_6140 ?auto_6142 ?auto_6141 ?auto_6138 )
      ( FLY-4PPL-VERIFY ?auto_6139 ?auto_6140 ?auto_6141 ?auto_6142 ?auto_6138 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6777 - PERSON
      ?auto_6778 - PERSON
      ?auto_6779 - PERSON
      ?auto_6780 - PERSON
      ?auto_6776 - CITY
    )
    :vars
    (
      ?auto_6786 - FLEVEL
      ?auto_6785 - FLEVEL
      ?auto_6783 - CITY
      ?auto_6784 - CITY
      ?auto_6782 - CITY
      ?auto_6781 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6786 ?auto_6785 ) ( PERSON-AT ?auto_6780 ?auto_6783 ) ( not ( = ?auto_6776 ?auto_6783 ) ) ( not ( = ?auto_6786 ?auto_6785 ) ) ( PERSON-AT ?auto_6777 ?auto_6784 ) ( not ( = ?auto_6776 ?auto_6784 ) ) ( PERSON-AT ?auto_6779 ?auto_6782 ) ( not ( = ?auto_6776 ?auto_6782 ) ) ( PERSON-AT ?auto_6778 ?auto_6782 ) ( AIRCRAFT-AT ?auto_6781 ?auto_6776 ) ( FUEL-LEVEL ?auto_6781 ?auto_6786 ) ( not ( = ?auto_6778 ?auto_6779 ) ) ( not ( = ?auto_6778 ?auto_6777 ) ) ( not ( = ?auto_6779 ?auto_6777 ) ) ( not ( = ?auto_6784 ?auto_6782 ) ) ( not ( = ?auto_6778 ?auto_6780 ) ) ( not ( = ?auto_6779 ?auto_6780 ) ) ( not ( = ?auto_6777 ?auto_6780 ) ) ( not ( = ?auto_6783 ?auto_6784 ) ) ( not ( = ?auto_6783 ?auto_6782 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6778 ?auto_6777 ?auto_6779 ?auto_6780 ?auto_6776 )
      ( FLY-4PPL-VERIFY ?auto_6777 ?auto_6778 ?auto_6779 ?auto_6780 ?auto_6776 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_6812 - PERSON
      ?auto_6813 - PERSON
      ?auto_6814 - PERSON
      ?auto_6815 - PERSON
      ?auto_6811 - CITY
    )
    :vars
    (
      ?auto_6821 - FLEVEL
      ?auto_6820 - FLEVEL
      ?auto_6818 - CITY
      ?auto_6819 - CITY
      ?auto_6817 - CITY
      ?auto_6816 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6821 ?auto_6820 ) ( PERSON-AT ?auto_6814 ?auto_6818 ) ( not ( = ?auto_6811 ?auto_6818 ) ) ( not ( = ?auto_6821 ?auto_6820 ) ) ( PERSON-AT ?auto_6812 ?auto_6819 ) ( not ( = ?auto_6811 ?auto_6819 ) ) ( PERSON-AT ?auto_6815 ?auto_6817 ) ( not ( = ?auto_6811 ?auto_6817 ) ) ( PERSON-AT ?auto_6813 ?auto_6817 ) ( AIRCRAFT-AT ?auto_6816 ?auto_6811 ) ( FUEL-LEVEL ?auto_6816 ?auto_6821 ) ( not ( = ?auto_6813 ?auto_6815 ) ) ( not ( = ?auto_6813 ?auto_6812 ) ) ( not ( = ?auto_6815 ?auto_6812 ) ) ( not ( = ?auto_6819 ?auto_6817 ) ) ( not ( = ?auto_6813 ?auto_6814 ) ) ( not ( = ?auto_6815 ?auto_6814 ) ) ( not ( = ?auto_6812 ?auto_6814 ) ) ( not ( = ?auto_6818 ?auto_6819 ) ) ( not ( = ?auto_6818 ?auto_6817 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_6813 ?auto_6812 ?auto_6815 ?auto_6814 ?auto_6811 )
      ( FLY-4PPL-VERIFY ?auto_6812 ?auto_6813 ?auto_6814 ?auto_6815 ?auto_6811 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_7016 - PERSON
      ?auto_7017 - PERSON
      ?auto_7018 - PERSON
      ?auto_7019 - PERSON
      ?auto_7015 - CITY
    )
    :vars
    (
      ?auto_7025 - FLEVEL
      ?auto_7024 - FLEVEL
      ?auto_7022 - CITY
      ?auto_7023 - CITY
      ?auto_7021 - CITY
      ?auto_7020 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7025 ?auto_7024 ) ( PERSON-AT ?auto_7017 ?auto_7022 ) ( not ( = ?auto_7015 ?auto_7022 ) ) ( not ( = ?auto_7025 ?auto_7024 ) ) ( PERSON-AT ?auto_7016 ?auto_7023 ) ( not ( = ?auto_7015 ?auto_7023 ) ) ( PERSON-AT ?auto_7019 ?auto_7021 ) ( not ( = ?auto_7015 ?auto_7021 ) ) ( PERSON-AT ?auto_7018 ?auto_7021 ) ( AIRCRAFT-AT ?auto_7020 ?auto_7015 ) ( FUEL-LEVEL ?auto_7020 ?auto_7025 ) ( not ( = ?auto_7018 ?auto_7019 ) ) ( not ( = ?auto_7018 ?auto_7016 ) ) ( not ( = ?auto_7019 ?auto_7016 ) ) ( not ( = ?auto_7023 ?auto_7021 ) ) ( not ( = ?auto_7018 ?auto_7017 ) ) ( not ( = ?auto_7019 ?auto_7017 ) ) ( not ( = ?auto_7016 ?auto_7017 ) ) ( not ( = ?auto_7022 ?auto_7023 ) ) ( not ( = ?auto_7022 ?auto_7021 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_7018 ?auto_7016 ?auto_7019 ?auto_7017 ?auto_7015 )
      ( FLY-4PPL-VERIFY ?auto_7016 ?auto_7017 ?auto_7018 ?auto_7019 ?auto_7015 ) )
  )

)

