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
      ?auto_11684 - PERSON
      ?auto_11683 - CITY
    )
    :vars
    (
      ?auto_11687 - FLEVEL
      ?auto_11686 - FLEVEL
      ?auto_11688 - CITY
      ?auto_11685 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11687 ?auto_11686 ) ( PERSON-AT ?auto_11684 ?auto_11688 ) ( AIRCRAFT-AT ?auto_11685 ?auto_11683 ) ( FUEL-LEVEL ?auto_11685 ?auto_11687 ) ( not ( = ?auto_11683 ?auto_11688 ) ) ( not ( = ?auto_11687 ?auto_11686 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_11685 ?auto_11683 ?auto_11687 ?auto_11686 )
      ( !FLY ?auto_11685 ?auto_11683 ?auto_11688 ?auto_11686 ?auto_11687 )
      ( !REFUEL ?auto_11685 ?auto_11688 ?auto_11687 ?auto_11686 )
      ( !BOARD ?auto_11684 ?auto_11685 ?auto_11688 )
      ( !FLY ?auto_11685 ?auto_11688 ?auto_11683 ?auto_11686 ?auto_11687 )
      ( !DEBARK ?auto_11684 ?auto_11685 ?auto_11683 )
      ( FLY-1PPL-VERIFY ?auto_11684 ?auto_11683 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11692 - PERSON
      ?auto_11691 - CITY
    )
    :vars
    (
      ?auto_11695 - FLEVEL
      ?auto_11694 - FLEVEL
      ?auto_11696 - CITY
      ?auto_11693 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11695 ?auto_11694 ) ( PERSON-AT ?auto_11692 ?auto_11696 ) ( AIRCRAFT-AT ?auto_11693 ?auto_11691 ) ( FUEL-LEVEL ?auto_11693 ?auto_11695 ) ( not ( = ?auto_11691 ?auto_11696 ) ) ( not ( = ?auto_11695 ?auto_11694 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_11693 ?auto_11691 ?auto_11695 ?auto_11694 )
      ( !FLY ?auto_11693 ?auto_11691 ?auto_11696 ?auto_11694 ?auto_11695 )
      ( !REFUEL ?auto_11693 ?auto_11696 ?auto_11695 ?auto_11694 )
      ( !BOARD ?auto_11692 ?auto_11693 ?auto_11696 )
      ( !FLY ?auto_11693 ?auto_11696 ?auto_11691 ?auto_11694 ?auto_11695 )
      ( !DEBARK ?auto_11692 ?auto_11693 ?auto_11691 )
      ( FLY-1PPL-VERIFY ?auto_11692 ?auto_11691 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11707 - PERSON
      ?auto_11708 - PERSON
      ?auto_11706 - CITY
    )
    :vars
    (
      ?auto_11709 - FLEVEL
      ?auto_11711 - FLEVEL
      ?auto_11712 - CITY
      ?auto_11713 - CITY
      ?auto_11710 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11709 ?auto_11711 ) ( PERSON-AT ?auto_11708 ?auto_11712 ) ( not ( = ?auto_11706 ?auto_11712 ) ) ( not ( = ?auto_11709 ?auto_11711 ) ) ( PERSON-AT ?auto_11707 ?auto_11713 ) ( AIRCRAFT-AT ?auto_11710 ?auto_11706 ) ( FUEL-LEVEL ?auto_11710 ?auto_11709 ) ( not ( = ?auto_11706 ?auto_11713 ) ) ( not ( = ?auto_11707 ?auto_11708 ) ) ( not ( = ?auto_11712 ?auto_11713 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11707 ?auto_11706 )
      ( FLY-1PPL ?auto_11708 ?auto_11706 )
      ( FLY-2PPL-VERIFY ?auto_11707 ?auto_11708 ?auto_11706 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11715 - PERSON
      ?auto_11716 - PERSON
      ?auto_11714 - CITY
    )
    :vars
    (
      ?auto_11719 - FLEVEL
      ?auto_11721 - FLEVEL
      ?auto_11718 - CITY
      ?auto_11717 - CITY
      ?auto_11720 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11719 ?auto_11721 ) ( PERSON-AT ?auto_11715 ?auto_11718 ) ( not ( = ?auto_11714 ?auto_11718 ) ) ( not ( = ?auto_11719 ?auto_11721 ) ) ( PERSON-AT ?auto_11716 ?auto_11717 ) ( AIRCRAFT-AT ?auto_11720 ?auto_11714 ) ( FUEL-LEVEL ?auto_11720 ?auto_11719 ) ( not ( = ?auto_11714 ?auto_11717 ) ) ( not ( = ?auto_11716 ?auto_11715 ) ) ( not ( = ?auto_11718 ?auto_11717 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11716 ?auto_11715 ?auto_11714 )
      ( FLY-2PPL-VERIFY ?auto_11715 ?auto_11716 ?auto_11714 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11734 - PERSON
      ?auto_11733 - CITY
    )
    :vars
    (
      ?auto_11737 - FLEVEL
      ?auto_11736 - FLEVEL
      ?auto_11738 - CITY
      ?auto_11735 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11737 ?auto_11736 ) ( PERSON-AT ?auto_11734 ?auto_11738 ) ( AIRCRAFT-AT ?auto_11735 ?auto_11733 ) ( FUEL-LEVEL ?auto_11735 ?auto_11737 ) ( not ( = ?auto_11733 ?auto_11738 ) ) ( not ( = ?auto_11737 ?auto_11736 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_11735 ?auto_11733 ?auto_11737 ?auto_11736 )
      ( !FLY ?auto_11735 ?auto_11733 ?auto_11738 ?auto_11736 ?auto_11737 )
      ( !REFUEL ?auto_11735 ?auto_11738 ?auto_11737 ?auto_11736 )
      ( !BOARD ?auto_11734 ?auto_11735 ?auto_11738 )
      ( !FLY ?auto_11735 ?auto_11738 ?auto_11733 ?auto_11736 ?auto_11737 )
      ( !DEBARK ?auto_11734 ?auto_11735 ?auto_11733 )
      ( FLY-1PPL-VERIFY ?auto_11734 ?auto_11733 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11827 - PERSON
      ?auto_11828 - PERSON
      ?auto_11829 - PERSON
      ?auto_11826 - CITY
    )
    :vars
    (
      ?auto_11830 - FLEVEL
      ?auto_11832 - FLEVEL
      ?auto_11831 - CITY
      ?auto_11834 - CITY
      ?auto_11835 - CITY
      ?auto_11833 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11830 ?auto_11832 ) ( PERSON-AT ?auto_11829 ?auto_11831 ) ( not ( = ?auto_11826 ?auto_11831 ) ) ( not ( = ?auto_11830 ?auto_11832 ) ) ( PERSON-AT ?auto_11828 ?auto_11834 ) ( not ( = ?auto_11826 ?auto_11834 ) ) ( PERSON-AT ?auto_11827 ?auto_11835 ) ( AIRCRAFT-AT ?auto_11833 ?auto_11826 ) ( FUEL-LEVEL ?auto_11833 ?auto_11830 ) ( not ( = ?auto_11826 ?auto_11835 ) ) ( not ( = ?auto_11827 ?auto_11828 ) ) ( not ( = ?auto_11834 ?auto_11835 ) ) ( not ( = ?auto_11827 ?auto_11829 ) ) ( not ( = ?auto_11828 ?auto_11829 ) ) ( not ( = ?auto_11831 ?auto_11834 ) ) ( not ( = ?auto_11831 ?auto_11835 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11828 ?auto_11827 ?auto_11826 )
      ( FLY-1PPL ?auto_11829 ?auto_11826 )
      ( FLY-3PPL-VERIFY ?auto_11827 ?auto_11828 ?auto_11829 ?auto_11826 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11848 - PERSON
      ?auto_11849 - PERSON
      ?auto_11850 - PERSON
      ?auto_11847 - CITY
    )
    :vars
    (
      ?auto_11852 - FLEVEL
      ?auto_11854 - FLEVEL
      ?auto_11851 - CITY
      ?auto_11856 - CITY
      ?auto_11853 - CITY
      ?auto_11855 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11852 ?auto_11854 ) ( PERSON-AT ?auto_11849 ?auto_11851 ) ( not ( = ?auto_11847 ?auto_11851 ) ) ( not ( = ?auto_11852 ?auto_11854 ) ) ( PERSON-AT ?auto_11850 ?auto_11856 ) ( not ( = ?auto_11847 ?auto_11856 ) ) ( PERSON-AT ?auto_11848 ?auto_11853 ) ( AIRCRAFT-AT ?auto_11855 ?auto_11847 ) ( FUEL-LEVEL ?auto_11855 ?auto_11852 ) ( not ( = ?auto_11847 ?auto_11853 ) ) ( not ( = ?auto_11848 ?auto_11850 ) ) ( not ( = ?auto_11856 ?auto_11853 ) ) ( not ( = ?auto_11848 ?auto_11849 ) ) ( not ( = ?auto_11850 ?auto_11849 ) ) ( not ( = ?auto_11851 ?auto_11856 ) ) ( not ( = ?auto_11851 ?auto_11853 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_11848 ?auto_11850 ?auto_11849 ?auto_11847 )
      ( FLY-3PPL-VERIFY ?auto_11848 ?auto_11849 ?auto_11850 ?auto_11847 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11869 - PERSON
      ?auto_11870 - PERSON
      ?auto_11871 - PERSON
      ?auto_11868 - CITY
    )
    :vars
    (
      ?auto_11873 - FLEVEL
      ?auto_11876 - FLEVEL
      ?auto_11877 - CITY
      ?auto_11874 - CITY
      ?auto_11875 - CITY
      ?auto_11872 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11873 ?auto_11876 ) ( PERSON-AT ?auto_11871 ?auto_11877 ) ( not ( = ?auto_11868 ?auto_11877 ) ) ( not ( = ?auto_11873 ?auto_11876 ) ) ( PERSON-AT ?auto_11869 ?auto_11874 ) ( not ( = ?auto_11868 ?auto_11874 ) ) ( PERSON-AT ?auto_11870 ?auto_11875 ) ( AIRCRAFT-AT ?auto_11872 ?auto_11868 ) ( FUEL-LEVEL ?auto_11872 ?auto_11873 ) ( not ( = ?auto_11868 ?auto_11875 ) ) ( not ( = ?auto_11870 ?auto_11869 ) ) ( not ( = ?auto_11874 ?auto_11875 ) ) ( not ( = ?auto_11870 ?auto_11871 ) ) ( not ( = ?auto_11869 ?auto_11871 ) ) ( not ( = ?auto_11877 ?auto_11874 ) ) ( not ( = ?auto_11877 ?auto_11875 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_11870 ?auto_11871 ?auto_11869 ?auto_11868 )
      ( FLY-3PPL-VERIFY ?auto_11869 ?auto_11870 ?auto_11871 ?auto_11868 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11890 - PERSON
      ?auto_11891 - PERSON
      ?auto_11892 - PERSON
      ?auto_11889 - CITY
    )
    :vars
    (
      ?auto_11894 - FLEVEL
      ?auto_11897 - FLEVEL
      ?auto_11898 - CITY
      ?auto_11895 - CITY
      ?auto_11896 - CITY
      ?auto_11893 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11894 ?auto_11897 ) ( PERSON-AT ?auto_11891 ?auto_11898 ) ( not ( = ?auto_11889 ?auto_11898 ) ) ( not ( = ?auto_11894 ?auto_11897 ) ) ( PERSON-AT ?auto_11890 ?auto_11895 ) ( not ( = ?auto_11889 ?auto_11895 ) ) ( PERSON-AT ?auto_11892 ?auto_11896 ) ( AIRCRAFT-AT ?auto_11893 ?auto_11889 ) ( FUEL-LEVEL ?auto_11893 ?auto_11894 ) ( not ( = ?auto_11889 ?auto_11896 ) ) ( not ( = ?auto_11892 ?auto_11890 ) ) ( not ( = ?auto_11895 ?auto_11896 ) ) ( not ( = ?auto_11892 ?auto_11891 ) ) ( not ( = ?auto_11890 ?auto_11891 ) ) ( not ( = ?auto_11898 ?auto_11895 ) ) ( not ( = ?auto_11898 ?auto_11896 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_11892 ?auto_11891 ?auto_11890 ?auto_11889 )
      ( FLY-3PPL-VERIFY ?auto_11890 ?auto_11891 ?auto_11892 ?auto_11889 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11933 - PERSON
      ?auto_11934 - PERSON
      ?auto_11935 - PERSON
      ?auto_11932 - CITY
    )
    :vars
    (
      ?auto_11937 - FLEVEL
      ?auto_11940 - FLEVEL
      ?auto_11941 - CITY
      ?auto_11938 - CITY
      ?auto_11939 - CITY
      ?auto_11936 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11937 ?auto_11940 ) ( PERSON-AT ?auto_11933 ?auto_11941 ) ( not ( = ?auto_11932 ?auto_11941 ) ) ( not ( = ?auto_11937 ?auto_11940 ) ) ( PERSON-AT ?auto_11935 ?auto_11938 ) ( not ( = ?auto_11932 ?auto_11938 ) ) ( PERSON-AT ?auto_11934 ?auto_11939 ) ( AIRCRAFT-AT ?auto_11936 ?auto_11932 ) ( FUEL-LEVEL ?auto_11936 ?auto_11937 ) ( not ( = ?auto_11932 ?auto_11939 ) ) ( not ( = ?auto_11934 ?auto_11935 ) ) ( not ( = ?auto_11938 ?auto_11939 ) ) ( not ( = ?auto_11934 ?auto_11933 ) ) ( not ( = ?auto_11935 ?auto_11933 ) ) ( not ( = ?auto_11941 ?auto_11938 ) ) ( not ( = ?auto_11941 ?auto_11939 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_11934 ?auto_11933 ?auto_11935 ?auto_11932 )
      ( FLY-3PPL-VERIFY ?auto_11933 ?auto_11934 ?auto_11935 ?auto_11932 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11954 - PERSON
      ?auto_11955 - PERSON
      ?auto_11956 - PERSON
      ?auto_11953 - CITY
    )
    :vars
    (
      ?auto_11958 - FLEVEL
      ?auto_11961 - FLEVEL
      ?auto_11962 - CITY
      ?auto_11959 - CITY
      ?auto_11960 - CITY
      ?auto_11957 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11958 ?auto_11961 ) ( PERSON-AT ?auto_11954 ?auto_11962 ) ( not ( = ?auto_11953 ?auto_11962 ) ) ( not ( = ?auto_11958 ?auto_11961 ) ) ( PERSON-AT ?auto_11955 ?auto_11959 ) ( not ( = ?auto_11953 ?auto_11959 ) ) ( PERSON-AT ?auto_11956 ?auto_11960 ) ( AIRCRAFT-AT ?auto_11957 ?auto_11953 ) ( FUEL-LEVEL ?auto_11957 ?auto_11958 ) ( not ( = ?auto_11953 ?auto_11960 ) ) ( not ( = ?auto_11956 ?auto_11955 ) ) ( not ( = ?auto_11959 ?auto_11960 ) ) ( not ( = ?auto_11956 ?auto_11954 ) ) ( not ( = ?auto_11955 ?auto_11954 ) ) ( not ( = ?auto_11962 ?auto_11959 ) ) ( not ( = ?auto_11962 ?auto_11960 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_11956 ?auto_11954 ?auto_11955 ?auto_11953 )
      ( FLY-3PPL-VERIFY ?auto_11954 ?auto_11955 ?auto_11956 ?auto_11953 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12022 - PERSON
      ?auto_12021 - CITY
    )
    :vars
    (
      ?auto_12025 - FLEVEL
      ?auto_12024 - FLEVEL
      ?auto_12026 - CITY
      ?auto_12023 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12025 ?auto_12024 ) ( PERSON-AT ?auto_12022 ?auto_12026 ) ( AIRCRAFT-AT ?auto_12023 ?auto_12021 ) ( FUEL-LEVEL ?auto_12023 ?auto_12025 ) ( not ( = ?auto_12021 ?auto_12026 ) ) ( not ( = ?auto_12025 ?auto_12024 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_12023 ?auto_12021 ?auto_12025 ?auto_12024 )
      ( !FLY ?auto_12023 ?auto_12021 ?auto_12026 ?auto_12024 ?auto_12025 )
      ( !REFUEL ?auto_12023 ?auto_12026 ?auto_12025 ?auto_12024 )
      ( !BOARD ?auto_12022 ?auto_12023 ?auto_12026 )
      ( !FLY ?auto_12023 ?auto_12026 ?auto_12021 ?auto_12024 ?auto_12025 )
      ( !DEBARK ?auto_12022 ?auto_12023 ?auto_12021 )
      ( FLY-1PPL-VERIFY ?auto_12022 ?auto_12021 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13023 - PERSON
      ?auto_13024 - PERSON
      ?auto_13025 - PERSON
      ?auto_13026 - PERSON
      ?auto_13022 - CITY
    )
    :vars
    (
      ?auto_13029 - FLEVEL
      ?auto_13030 - FLEVEL
      ?auto_13028 - CITY
      ?auto_13033 - CITY
      ?auto_13031 - CITY
      ?auto_13032 - CITY
      ?auto_13027 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13029 ?auto_13030 ) ( PERSON-AT ?auto_13026 ?auto_13028 ) ( not ( = ?auto_13022 ?auto_13028 ) ) ( not ( = ?auto_13029 ?auto_13030 ) ) ( PERSON-AT ?auto_13025 ?auto_13033 ) ( not ( = ?auto_13022 ?auto_13033 ) ) ( PERSON-AT ?auto_13024 ?auto_13031 ) ( not ( = ?auto_13022 ?auto_13031 ) ) ( PERSON-AT ?auto_13023 ?auto_13032 ) ( AIRCRAFT-AT ?auto_13027 ?auto_13022 ) ( FUEL-LEVEL ?auto_13027 ?auto_13029 ) ( not ( = ?auto_13022 ?auto_13032 ) ) ( not ( = ?auto_13023 ?auto_13024 ) ) ( not ( = ?auto_13031 ?auto_13032 ) ) ( not ( = ?auto_13023 ?auto_13025 ) ) ( not ( = ?auto_13024 ?auto_13025 ) ) ( not ( = ?auto_13033 ?auto_13031 ) ) ( not ( = ?auto_13033 ?auto_13032 ) ) ( not ( = ?auto_13023 ?auto_13026 ) ) ( not ( = ?auto_13024 ?auto_13026 ) ) ( not ( = ?auto_13025 ?auto_13026 ) ) ( not ( = ?auto_13028 ?auto_13033 ) ) ( not ( = ?auto_13028 ?auto_13031 ) ) ( not ( = ?auto_13028 ?auto_13032 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_13023 ?auto_13025 ?auto_13024 ?auto_13022 )
      ( FLY-1PPL ?auto_13026 ?auto_13022 )
      ( FLY-4PPL-VERIFY ?auto_13023 ?auto_13024 ?auto_13025 ?auto_13026 ?auto_13022 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13061 - PERSON
      ?auto_13062 - PERSON
      ?auto_13063 - PERSON
      ?auto_13064 - PERSON
      ?auto_13060 - CITY
    )
    :vars
    (
      ?auto_13069 - FLEVEL
      ?auto_13068 - FLEVEL
      ?auto_13065 - CITY
      ?auto_13071 - CITY
      ?auto_13066 - CITY
      ?auto_13067 - CITY
      ?auto_13070 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13069 ?auto_13068 ) ( PERSON-AT ?auto_13063 ?auto_13065 ) ( not ( = ?auto_13060 ?auto_13065 ) ) ( not ( = ?auto_13069 ?auto_13068 ) ) ( PERSON-AT ?auto_13064 ?auto_13071 ) ( not ( = ?auto_13060 ?auto_13071 ) ) ( PERSON-AT ?auto_13062 ?auto_13066 ) ( not ( = ?auto_13060 ?auto_13066 ) ) ( PERSON-AT ?auto_13061 ?auto_13067 ) ( AIRCRAFT-AT ?auto_13070 ?auto_13060 ) ( FUEL-LEVEL ?auto_13070 ?auto_13069 ) ( not ( = ?auto_13060 ?auto_13067 ) ) ( not ( = ?auto_13061 ?auto_13062 ) ) ( not ( = ?auto_13066 ?auto_13067 ) ) ( not ( = ?auto_13061 ?auto_13064 ) ) ( not ( = ?auto_13062 ?auto_13064 ) ) ( not ( = ?auto_13071 ?auto_13066 ) ) ( not ( = ?auto_13071 ?auto_13067 ) ) ( not ( = ?auto_13061 ?auto_13063 ) ) ( not ( = ?auto_13062 ?auto_13063 ) ) ( not ( = ?auto_13064 ?auto_13063 ) ) ( not ( = ?auto_13065 ?auto_13071 ) ) ( not ( = ?auto_13065 ?auto_13066 ) ) ( not ( = ?auto_13065 ?auto_13067 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13061 ?auto_13062 ?auto_13064 ?auto_13063 ?auto_13060 )
      ( FLY-4PPL-VERIFY ?auto_13061 ?auto_13062 ?auto_13063 ?auto_13064 ?auto_13060 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13099 - PERSON
      ?auto_13100 - PERSON
      ?auto_13101 - PERSON
      ?auto_13102 - PERSON
      ?auto_13098 - CITY
    )
    :vars
    (
      ?auto_13104 - FLEVEL
      ?auto_13103 - FLEVEL
      ?auto_13106 - CITY
      ?auto_13109 - CITY
      ?auto_13108 - CITY
      ?auto_13105 - CITY
      ?auto_13107 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13104 ?auto_13103 ) ( PERSON-AT ?auto_13102 ?auto_13106 ) ( not ( = ?auto_13098 ?auto_13106 ) ) ( not ( = ?auto_13104 ?auto_13103 ) ) ( PERSON-AT ?auto_13100 ?auto_13109 ) ( not ( = ?auto_13098 ?auto_13109 ) ) ( PERSON-AT ?auto_13101 ?auto_13108 ) ( not ( = ?auto_13098 ?auto_13108 ) ) ( PERSON-AT ?auto_13099 ?auto_13105 ) ( AIRCRAFT-AT ?auto_13107 ?auto_13098 ) ( FUEL-LEVEL ?auto_13107 ?auto_13104 ) ( not ( = ?auto_13098 ?auto_13105 ) ) ( not ( = ?auto_13099 ?auto_13101 ) ) ( not ( = ?auto_13108 ?auto_13105 ) ) ( not ( = ?auto_13099 ?auto_13100 ) ) ( not ( = ?auto_13101 ?auto_13100 ) ) ( not ( = ?auto_13109 ?auto_13108 ) ) ( not ( = ?auto_13109 ?auto_13105 ) ) ( not ( = ?auto_13099 ?auto_13102 ) ) ( not ( = ?auto_13101 ?auto_13102 ) ) ( not ( = ?auto_13100 ?auto_13102 ) ) ( not ( = ?auto_13106 ?auto_13109 ) ) ( not ( = ?auto_13106 ?auto_13108 ) ) ( not ( = ?auto_13106 ?auto_13105 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13099 ?auto_13101 ?auto_13102 ?auto_13100 ?auto_13098 )
      ( FLY-4PPL-VERIFY ?auto_13099 ?auto_13100 ?auto_13101 ?auto_13102 ?auto_13098 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13137 - PERSON
      ?auto_13138 - PERSON
      ?auto_13139 - PERSON
      ?auto_13140 - PERSON
      ?auto_13136 - CITY
    )
    :vars
    (
      ?auto_13142 - FLEVEL
      ?auto_13141 - FLEVEL
      ?auto_13144 - CITY
      ?auto_13147 - CITY
      ?auto_13146 - CITY
      ?auto_13143 - CITY
      ?auto_13145 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13142 ?auto_13141 ) ( PERSON-AT ?auto_13139 ?auto_13144 ) ( not ( = ?auto_13136 ?auto_13144 ) ) ( not ( = ?auto_13142 ?auto_13141 ) ) ( PERSON-AT ?auto_13138 ?auto_13147 ) ( not ( = ?auto_13136 ?auto_13147 ) ) ( PERSON-AT ?auto_13140 ?auto_13146 ) ( not ( = ?auto_13136 ?auto_13146 ) ) ( PERSON-AT ?auto_13137 ?auto_13143 ) ( AIRCRAFT-AT ?auto_13145 ?auto_13136 ) ( FUEL-LEVEL ?auto_13145 ?auto_13142 ) ( not ( = ?auto_13136 ?auto_13143 ) ) ( not ( = ?auto_13137 ?auto_13140 ) ) ( not ( = ?auto_13146 ?auto_13143 ) ) ( not ( = ?auto_13137 ?auto_13138 ) ) ( not ( = ?auto_13140 ?auto_13138 ) ) ( not ( = ?auto_13147 ?auto_13146 ) ) ( not ( = ?auto_13147 ?auto_13143 ) ) ( not ( = ?auto_13137 ?auto_13139 ) ) ( not ( = ?auto_13140 ?auto_13139 ) ) ( not ( = ?auto_13138 ?auto_13139 ) ) ( not ( = ?auto_13144 ?auto_13147 ) ) ( not ( = ?auto_13144 ?auto_13146 ) ) ( not ( = ?auto_13144 ?auto_13143 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13137 ?auto_13140 ?auto_13139 ?auto_13138 ?auto_13136 )
      ( FLY-4PPL-VERIFY ?auto_13137 ?auto_13138 ?auto_13139 ?auto_13140 ?auto_13136 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13255 - PERSON
      ?auto_13256 - PERSON
      ?auto_13257 - PERSON
      ?auto_13258 - PERSON
      ?auto_13254 - CITY
    )
    :vars
    (
      ?auto_13260 - FLEVEL
      ?auto_13259 - FLEVEL
      ?auto_13262 - CITY
      ?auto_13265 - CITY
      ?auto_13264 - CITY
      ?auto_13261 - CITY
      ?auto_13263 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13260 ?auto_13259 ) ( PERSON-AT ?auto_13256 ?auto_13262 ) ( not ( = ?auto_13254 ?auto_13262 ) ) ( not ( = ?auto_13260 ?auto_13259 ) ) ( PERSON-AT ?auto_13258 ?auto_13265 ) ( not ( = ?auto_13254 ?auto_13265 ) ) ( PERSON-AT ?auto_13257 ?auto_13264 ) ( not ( = ?auto_13254 ?auto_13264 ) ) ( PERSON-AT ?auto_13255 ?auto_13261 ) ( AIRCRAFT-AT ?auto_13263 ?auto_13254 ) ( FUEL-LEVEL ?auto_13263 ?auto_13260 ) ( not ( = ?auto_13254 ?auto_13261 ) ) ( not ( = ?auto_13255 ?auto_13257 ) ) ( not ( = ?auto_13264 ?auto_13261 ) ) ( not ( = ?auto_13255 ?auto_13258 ) ) ( not ( = ?auto_13257 ?auto_13258 ) ) ( not ( = ?auto_13265 ?auto_13264 ) ) ( not ( = ?auto_13265 ?auto_13261 ) ) ( not ( = ?auto_13255 ?auto_13256 ) ) ( not ( = ?auto_13257 ?auto_13256 ) ) ( not ( = ?auto_13258 ?auto_13256 ) ) ( not ( = ?auto_13262 ?auto_13265 ) ) ( not ( = ?auto_13262 ?auto_13264 ) ) ( not ( = ?auto_13262 ?auto_13261 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13255 ?auto_13257 ?auto_13256 ?auto_13258 ?auto_13254 )
      ( FLY-4PPL-VERIFY ?auto_13255 ?auto_13256 ?auto_13257 ?auto_13258 ?auto_13254 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13293 - PERSON
      ?auto_13294 - PERSON
      ?auto_13295 - PERSON
      ?auto_13296 - PERSON
      ?auto_13292 - CITY
    )
    :vars
    (
      ?auto_13298 - FLEVEL
      ?auto_13297 - FLEVEL
      ?auto_13300 - CITY
      ?auto_13303 - CITY
      ?auto_13302 - CITY
      ?auto_13299 - CITY
      ?auto_13301 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13298 ?auto_13297 ) ( PERSON-AT ?auto_13294 ?auto_13300 ) ( not ( = ?auto_13292 ?auto_13300 ) ) ( not ( = ?auto_13298 ?auto_13297 ) ) ( PERSON-AT ?auto_13295 ?auto_13303 ) ( not ( = ?auto_13292 ?auto_13303 ) ) ( PERSON-AT ?auto_13296 ?auto_13302 ) ( not ( = ?auto_13292 ?auto_13302 ) ) ( PERSON-AT ?auto_13293 ?auto_13299 ) ( AIRCRAFT-AT ?auto_13301 ?auto_13292 ) ( FUEL-LEVEL ?auto_13301 ?auto_13298 ) ( not ( = ?auto_13292 ?auto_13299 ) ) ( not ( = ?auto_13293 ?auto_13296 ) ) ( not ( = ?auto_13302 ?auto_13299 ) ) ( not ( = ?auto_13293 ?auto_13295 ) ) ( not ( = ?auto_13296 ?auto_13295 ) ) ( not ( = ?auto_13303 ?auto_13302 ) ) ( not ( = ?auto_13303 ?auto_13299 ) ) ( not ( = ?auto_13293 ?auto_13294 ) ) ( not ( = ?auto_13296 ?auto_13294 ) ) ( not ( = ?auto_13295 ?auto_13294 ) ) ( not ( = ?auto_13300 ?auto_13303 ) ) ( not ( = ?auto_13300 ?auto_13302 ) ) ( not ( = ?auto_13300 ?auto_13299 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13293 ?auto_13296 ?auto_13294 ?auto_13295 ?auto_13292 )
      ( FLY-4PPL-VERIFY ?auto_13293 ?auto_13294 ?auto_13295 ?auto_13296 ?auto_13292 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13411 - PERSON
      ?auto_13412 - PERSON
      ?auto_13413 - PERSON
      ?auto_13414 - PERSON
      ?auto_13410 - CITY
    )
    :vars
    (
      ?auto_13416 - FLEVEL
      ?auto_13415 - FLEVEL
      ?auto_13418 - CITY
      ?auto_13421 - CITY
      ?auto_13420 - CITY
      ?auto_13417 - CITY
      ?auto_13419 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13416 ?auto_13415 ) ( PERSON-AT ?auto_13414 ?auto_13418 ) ( not ( = ?auto_13410 ?auto_13418 ) ) ( not ( = ?auto_13416 ?auto_13415 ) ) ( PERSON-AT ?auto_13413 ?auto_13421 ) ( not ( = ?auto_13410 ?auto_13421 ) ) ( PERSON-AT ?auto_13411 ?auto_13420 ) ( not ( = ?auto_13410 ?auto_13420 ) ) ( PERSON-AT ?auto_13412 ?auto_13417 ) ( AIRCRAFT-AT ?auto_13419 ?auto_13410 ) ( FUEL-LEVEL ?auto_13419 ?auto_13416 ) ( not ( = ?auto_13410 ?auto_13417 ) ) ( not ( = ?auto_13412 ?auto_13411 ) ) ( not ( = ?auto_13420 ?auto_13417 ) ) ( not ( = ?auto_13412 ?auto_13413 ) ) ( not ( = ?auto_13411 ?auto_13413 ) ) ( not ( = ?auto_13421 ?auto_13420 ) ) ( not ( = ?auto_13421 ?auto_13417 ) ) ( not ( = ?auto_13412 ?auto_13414 ) ) ( not ( = ?auto_13411 ?auto_13414 ) ) ( not ( = ?auto_13413 ?auto_13414 ) ) ( not ( = ?auto_13418 ?auto_13421 ) ) ( not ( = ?auto_13418 ?auto_13420 ) ) ( not ( = ?auto_13418 ?auto_13417 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13412 ?auto_13411 ?auto_13414 ?auto_13413 ?auto_13410 )
      ( FLY-4PPL-VERIFY ?auto_13411 ?auto_13412 ?auto_13413 ?auto_13414 ?auto_13410 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13449 - PERSON
      ?auto_13450 - PERSON
      ?auto_13451 - PERSON
      ?auto_13452 - PERSON
      ?auto_13448 - CITY
    )
    :vars
    (
      ?auto_13454 - FLEVEL
      ?auto_13453 - FLEVEL
      ?auto_13456 - CITY
      ?auto_13459 - CITY
      ?auto_13458 - CITY
      ?auto_13455 - CITY
      ?auto_13457 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13454 ?auto_13453 ) ( PERSON-AT ?auto_13451 ?auto_13456 ) ( not ( = ?auto_13448 ?auto_13456 ) ) ( not ( = ?auto_13454 ?auto_13453 ) ) ( PERSON-AT ?auto_13452 ?auto_13459 ) ( not ( = ?auto_13448 ?auto_13459 ) ) ( PERSON-AT ?auto_13449 ?auto_13458 ) ( not ( = ?auto_13448 ?auto_13458 ) ) ( PERSON-AT ?auto_13450 ?auto_13455 ) ( AIRCRAFT-AT ?auto_13457 ?auto_13448 ) ( FUEL-LEVEL ?auto_13457 ?auto_13454 ) ( not ( = ?auto_13448 ?auto_13455 ) ) ( not ( = ?auto_13450 ?auto_13449 ) ) ( not ( = ?auto_13458 ?auto_13455 ) ) ( not ( = ?auto_13450 ?auto_13452 ) ) ( not ( = ?auto_13449 ?auto_13452 ) ) ( not ( = ?auto_13459 ?auto_13458 ) ) ( not ( = ?auto_13459 ?auto_13455 ) ) ( not ( = ?auto_13450 ?auto_13451 ) ) ( not ( = ?auto_13449 ?auto_13451 ) ) ( not ( = ?auto_13452 ?auto_13451 ) ) ( not ( = ?auto_13456 ?auto_13459 ) ) ( not ( = ?auto_13456 ?auto_13458 ) ) ( not ( = ?auto_13456 ?auto_13455 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13450 ?auto_13449 ?auto_13451 ?auto_13452 ?auto_13448 )
      ( FLY-4PPL-VERIFY ?auto_13449 ?auto_13450 ?auto_13451 ?auto_13452 ?auto_13448 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13568 - PERSON
      ?auto_13569 - PERSON
      ?auto_13570 - PERSON
      ?auto_13571 - PERSON
      ?auto_13567 - CITY
    )
    :vars
    (
      ?auto_13573 - FLEVEL
      ?auto_13572 - FLEVEL
      ?auto_13575 - CITY
      ?auto_13578 - CITY
      ?auto_13577 - CITY
      ?auto_13574 - CITY
      ?auto_13576 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13573 ?auto_13572 ) ( PERSON-AT ?auto_13571 ?auto_13575 ) ( not ( = ?auto_13567 ?auto_13575 ) ) ( not ( = ?auto_13573 ?auto_13572 ) ) ( PERSON-AT ?auto_13569 ?auto_13578 ) ( not ( = ?auto_13567 ?auto_13578 ) ) ( PERSON-AT ?auto_13568 ?auto_13577 ) ( not ( = ?auto_13567 ?auto_13577 ) ) ( PERSON-AT ?auto_13570 ?auto_13574 ) ( AIRCRAFT-AT ?auto_13576 ?auto_13567 ) ( FUEL-LEVEL ?auto_13576 ?auto_13573 ) ( not ( = ?auto_13567 ?auto_13574 ) ) ( not ( = ?auto_13570 ?auto_13568 ) ) ( not ( = ?auto_13577 ?auto_13574 ) ) ( not ( = ?auto_13570 ?auto_13569 ) ) ( not ( = ?auto_13568 ?auto_13569 ) ) ( not ( = ?auto_13578 ?auto_13577 ) ) ( not ( = ?auto_13578 ?auto_13574 ) ) ( not ( = ?auto_13570 ?auto_13571 ) ) ( not ( = ?auto_13568 ?auto_13571 ) ) ( not ( = ?auto_13569 ?auto_13571 ) ) ( not ( = ?auto_13575 ?auto_13578 ) ) ( not ( = ?auto_13575 ?auto_13577 ) ) ( not ( = ?auto_13575 ?auto_13574 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13570 ?auto_13568 ?auto_13571 ?auto_13569 ?auto_13567 )
      ( FLY-4PPL-VERIFY ?auto_13568 ?auto_13569 ?auto_13570 ?auto_13571 ?auto_13567 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13606 - PERSON
      ?auto_13607 - PERSON
      ?auto_13608 - PERSON
      ?auto_13609 - PERSON
      ?auto_13605 - CITY
    )
    :vars
    (
      ?auto_13611 - FLEVEL
      ?auto_13610 - FLEVEL
      ?auto_13613 - CITY
      ?auto_13616 - CITY
      ?auto_13615 - CITY
      ?auto_13612 - CITY
      ?auto_13614 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13611 ?auto_13610 ) ( PERSON-AT ?auto_13608 ?auto_13613 ) ( not ( = ?auto_13605 ?auto_13613 ) ) ( not ( = ?auto_13611 ?auto_13610 ) ) ( PERSON-AT ?auto_13607 ?auto_13616 ) ( not ( = ?auto_13605 ?auto_13616 ) ) ( PERSON-AT ?auto_13606 ?auto_13615 ) ( not ( = ?auto_13605 ?auto_13615 ) ) ( PERSON-AT ?auto_13609 ?auto_13612 ) ( AIRCRAFT-AT ?auto_13614 ?auto_13605 ) ( FUEL-LEVEL ?auto_13614 ?auto_13611 ) ( not ( = ?auto_13605 ?auto_13612 ) ) ( not ( = ?auto_13609 ?auto_13606 ) ) ( not ( = ?auto_13615 ?auto_13612 ) ) ( not ( = ?auto_13609 ?auto_13607 ) ) ( not ( = ?auto_13606 ?auto_13607 ) ) ( not ( = ?auto_13616 ?auto_13615 ) ) ( not ( = ?auto_13616 ?auto_13612 ) ) ( not ( = ?auto_13609 ?auto_13608 ) ) ( not ( = ?auto_13606 ?auto_13608 ) ) ( not ( = ?auto_13607 ?auto_13608 ) ) ( not ( = ?auto_13613 ?auto_13616 ) ) ( not ( = ?auto_13613 ?auto_13615 ) ) ( not ( = ?auto_13613 ?auto_13612 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13609 ?auto_13606 ?auto_13608 ?auto_13607 ?auto_13605 )
      ( FLY-4PPL-VERIFY ?auto_13606 ?auto_13607 ?auto_13608 ?auto_13609 ?auto_13605 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13683 - PERSON
      ?auto_13684 - PERSON
      ?auto_13685 - PERSON
      ?auto_13686 - PERSON
      ?auto_13682 - CITY
    )
    :vars
    (
      ?auto_13688 - FLEVEL
      ?auto_13687 - FLEVEL
      ?auto_13690 - CITY
      ?auto_13693 - CITY
      ?auto_13692 - CITY
      ?auto_13689 - CITY
      ?auto_13691 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13688 ?auto_13687 ) ( PERSON-AT ?auto_13684 ?auto_13690 ) ( not ( = ?auto_13682 ?auto_13690 ) ) ( not ( = ?auto_13688 ?auto_13687 ) ) ( PERSON-AT ?auto_13686 ?auto_13693 ) ( not ( = ?auto_13682 ?auto_13693 ) ) ( PERSON-AT ?auto_13683 ?auto_13692 ) ( not ( = ?auto_13682 ?auto_13692 ) ) ( PERSON-AT ?auto_13685 ?auto_13689 ) ( AIRCRAFT-AT ?auto_13691 ?auto_13682 ) ( FUEL-LEVEL ?auto_13691 ?auto_13688 ) ( not ( = ?auto_13682 ?auto_13689 ) ) ( not ( = ?auto_13685 ?auto_13683 ) ) ( not ( = ?auto_13692 ?auto_13689 ) ) ( not ( = ?auto_13685 ?auto_13686 ) ) ( not ( = ?auto_13683 ?auto_13686 ) ) ( not ( = ?auto_13693 ?auto_13692 ) ) ( not ( = ?auto_13693 ?auto_13689 ) ) ( not ( = ?auto_13685 ?auto_13684 ) ) ( not ( = ?auto_13683 ?auto_13684 ) ) ( not ( = ?auto_13686 ?auto_13684 ) ) ( not ( = ?auto_13690 ?auto_13693 ) ) ( not ( = ?auto_13690 ?auto_13692 ) ) ( not ( = ?auto_13690 ?auto_13689 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13685 ?auto_13683 ?auto_13684 ?auto_13686 ?auto_13682 )
      ( FLY-4PPL-VERIFY ?auto_13683 ?auto_13684 ?auto_13685 ?auto_13686 ?auto_13682 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13762 - PERSON
      ?auto_13763 - PERSON
      ?auto_13764 - PERSON
      ?auto_13765 - PERSON
      ?auto_13761 - CITY
    )
    :vars
    (
      ?auto_13767 - FLEVEL
      ?auto_13766 - FLEVEL
      ?auto_13769 - CITY
      ?auto_13772 - CITY
      ?auto_13771 - CITY
      ?auto_13768 - CITY
      ?auto_13770 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13767 ?auto_13766 ) ( PERSON-AT ?auto_13763 ?auto_13769 ) ( not ( = ?auto_13761 ?auto_13769 ) ) ( not ( = ?auto_13767 ?auto_13766 ) ) ( PERSON-AT ?auto_13764 ?auto_13772 ) ( not ( = ?auto_13761 ?auto_13772 ) ) ( PERSON-AT ?auto_13762 ?auto_13771 ) ( not ( = ?auto_13761 ?auto_13771 ) ) ( PERSON-AT ?auto_13765 ?auto_13768 ) ( AIRCRAFT-AT ?auto_13770 ?auto_13761 ) ( FUEL-LEVEL ?auto_13770 ?auto_13767 ) ( not ( = ?auto_13761 ?auto_13768 ) ) ( not ( = ?auto_13765 ?auto_13762 ) ) ( not ( = ?auto_13771 ?auto_13768 ) ) ( not ( = ?auto_13765 ?auto_13764 ) ) ( not ( = ?auto_13762 ?auto_13764 ) ) ( not ( = ?auto_13772 ?auto_13771 ) ) ( not ( = ?auto_13772 ?auto_13768 ) ) ( not ( = ?auto_13765 ?auto_13763 ) ) ( not ( = ?auto_13762 ?auto_13763 ) ) ( not ( = ?auto_13764 ?auto_13763 ) ) ( not ( = ?auto_13769 ?auto_13772 ) ) ( not ( = ?auto_13769 ?auto_13771 ) ) ( not ( = ?auto_13769 ?auto_13768 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13765 ?auto_13762 ?auto_13763 ?auto_13764 ?auto_13761 )
      ( FLY-4PPL-VERIFY ?auto_13762 ?auto_13763 ?auto_13764 ?auto_13765 ?auto_13761 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13880 - PERSON
      ?auto_13881 - PERSON
      ?auto_13882 - PERSON
      ?auto_13883 - PERSON
      ?auto_13879 - CITY
    )
    :vars
    (
      ?auto_13885 - FLEVEL
      ?auto_13884 - FLEVEL
      ?auto_13887 - CITY
      ?auto_13890 - CITY
      ?auto_13889 - CITY
      ?auto_13886 - CITY
      ?auto_13888 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13885 ?auto_13884 ) ( PERSON-AT ?auto_13883 ?auto_13887 ) ( not ( = ?auto_13879 ?auto_13887 ) ) ( not ( = ?auto_13885 ?auto_13884 ) ) ( PERSON-AT ?auto_13880 ?auto_13890 ) ( not ( = ?auto_13879 ?auto_13890 ) ) ( PERSON-AT ?auto_13882 ?auto_13889 ) ( not ( = ?auto_13879 ?auto_13889 ) ) ( PERSON-AT ?auto_13881 ?auto_13886 ) ( AIRCRAFT-AT ?auto_13888 ?auto_13879 ) ( FUEL-LEVEL ?auto_13888 ?auto_13885 ) ( not ( = ?auto_13879 ?auto_13886 ) ) ( not ( = ?auto_13881 ?auto_13882 ) ) ( not ( = ?auto_13889 ?auto_13886 ) ) ( not ( = ?auto_13881 ?auto_13880 ) ) ( not ( = ?auto_13882 ?auto_13880 ) ) ( not ( = ?auto_13890 ?auto_13889 ) ) ( not ( = ?auto_13890 ?auto_13886 ) ) ( not ( = ?auto_13881 ?auto_13883 ) ) ( not ( = ?auto_13882 ?auto_13883 ) ) ( not ( = ?auto_13880 ?auto_13883 ) ) ( not ( = ?auto_13887 ?auto_13890 ) ) ( not ( = ?auto_13887 ?auto_13889 ) ) ( not ( = ?auto_13887 ?auto_13886 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13881 ?auto_13882 ?auto_13883 ?auto_13880 ?auto_13879 )
      ( FLY-4PPL-VERIFY ?auto_13880 ?auto_13881 ?auto_13882 ?auto_13883 ?auto_13879 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13918 - PERSON
      ?auto_13919 - PERSON
      ?auto_13920 - PERSON
      ?auto_13921 - PERSON
      ?auto_13917 - CITY
    )
    :vars
    (
      ?auto_13923 - FLEVEL
      ?auto_13922 - FLEVEL
      ?auto_13925 - CITY
      ?auto_13928 - CITY
      ?auto_13927 - CITY
      ?auto_13924 - CITY
      ?auto_13926 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13923 ?auto_13922 ) ( PERSON-AT ?auto_13920 ?auto_13925 ) ( not ( = ?auto_13917 ?auto_13925 ) ) ( not ( = ?auto_13923 ?auto_13922 ) ) ( PERSON-AT ?auto_13918 ?auto_13928 ) ( not ( = ?auto_13917 ?auto_13928 ) ) ( PERSON-AT ?auto_13921 ?auto_13927 ) ( not ( = ?auto_13917 ?auto_13927 ) ) ( PERSON-AT ?auto_13919 ?auto_13924 ) ( AIRCRAFT-AT ?auto_13926 ?auto_13917 ) ( FUEL-LEVEL ?auto_13926 ?auto_13923 ) ( not ( = ?auto_13917 ?auto_13924 ) ) ( not ( = ?auto_13919 ?auto_13921 ) ) ( not ( = ?auto_13927 ?auto_13924 ) ) ( not ( = ?auto_13919 ?auto_13918 ) ) ( not ( = ?auto_13921 ?auto_13918 ) ) ( not ( = ?auto_13928 ?auto_13927 ) ) ( not ( = ?auto_13928 ?auto_13924 ) ) ( not ( = ?auto_13919 ?auto_13920 ) ) ( not ( = ?auto_13921 ?auto_13920 ) ) ( not ( = ?auto_13918 ?auto_13920 ) ) ( not ( = ?auto_13925 ?auto_13928 ) ) ( not ( = ?auto_13925 ?auto_13927 ) ) ( not ( = ?auto_13925 ?auto_13924 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13919 ?auto_13921 ?auto_13920 ?auto_13918 ?auto_13917 )
      ( FLY-4PPL-VERIFY ?auto_13918 ?auto_13919 ?auto_13920 ?auto_13921 ?auto_13917 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13956 - PERSON
      ?auto_13957 - PERSON
      ?auto_13958 - PERSON
      ?auto_13959 - PERSON
      ?auto_13955 - CITY
    )
    :vars
    (
      ?auto_13961 - FLEVEL
      ?auto_13960 - FLEVEL
      ?auto_13963 - CITY
      ?auto_13966 - CITY
      ?auto_13965 - CITY
      ?auto_13962 - CITY
      ?auto_13964 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13961 ?auto_13960 ) ( PERSON-AT ?auto_13959 ?auto_13963 ) ( not ( = ?auto_13955 ?auto_13963 ) ) ( not ( = ?auto_13961 ?auto_13960 ) ) ( PERSON-AT ?auto_13956 ?auto_13966 ) ( not ( = ?auto_13955 ?auto_13966 ) ) ( PERSON-AT ?auto_13957 ?auto_13965 ) ( not ( = ?auto_13955 ?auto_13965 ) ) ( PERSON-AT ?auto_13958 ?auto_13962 ) ( AIRCRAFT-AT ?auto_13964 ?auto_13955 ) ( FUEL-LEVEL ?auto_13964 ?auto_13961 ) ( not ( = ?auto_13955 ?auto_13962 ) ) ( not ( = ?auto_13958 ?auto_13957 ) ) ( not ( = ?auto_13965 ?auto_13962 ) ) ( not ( = ?auto_13958 ?auto_13956 ) ) ( not ( = ?auto_13957 ?auto_13956 ) ) ( not ( = ?auto_13966 ?auto_13965 ) ) ( not ( = ?auto_13966 ?auto_13962 ) ) ( not ( = ?auto_13958 ?auto_13959 ) ) ( not ( = ?auto_13957 ?auto_13959 ) ) ( not ( = ?auto_13956 ?auto_13959 ) ) ( not ( = ?auto_13963 ?auto_13966 ) ) ( not ( = ?auto_13963 ?auto_13965 ) ) ( not ( = ?auto_13963 ?auto_13962 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13958 ?auto_13957 ?auto_13959 ?auto_13956 ?auto_13955 )
      ( FLY-4PPL-VERIFY ?auto_13956 ?auto_13957 ?auto_13958 ?auto_13959 ?auto_13955 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_13994 - PERSON
      ?auto_13995 - PERSON
      ?auto_13996 - PERSON
      ?auto_13997 - PERSON
      ?auto_13993 - CITY
    )
    :vars
    (
      ?auto_13999 - FLEVEL
      ?auto_13998 - FLEVEL
      ?auto_14001 - CITY
      ?auto_14004 - CITY
      ?auto_14003 - CITY
      ?auto_14000 - CITY
      ?auto_14002 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13999 ?auto_13998 ) ( PERSON-AT ?auto_13996 ?auto_14001 ) ( not ( = ?auto_13993 ?auto_14001 ) ) ( not ( = ?auto_13999 ?auto_13998 ) ) ( PERSON-AT ?auto_13994 ?auto_14004 ) ( not ( = ?auto_13993 ?auto_14004 ) ) ( PERSON-AT ?auto_13995 ?auto_14003 ) ( not ( = ?auto_13993 ?auto_14003 ) ) ( PERSON-AT ?auto_13997 ?auto_14000 ) ( AIRCRAFT-AT ?auto_14002 ?auto_13993 ) ( FUEL-LEVEL ?auto_14002 ?auto_13999 ) ( not ( = ?auto_13993 ?auto_14000 ) ) ( not ( = ?auto_13997 ?auto_13995 ) ) ( not ( = ?auto_14003 ?auto_14000 ) ) ( not ( = ?auto_13997 ?auto_13994 ) ) ( not ( = ?auto_13995 ?auto_13994 ) ) ( not ( = ?auto_14004 ?auto_14003 ) ) ( not ( = ?auto_14004 ?auto_14000 ) ) ( not ( = ?auto_13997 ?auto_13996 ) ) ( not ( = ?auto_13995 ?auto_13996 ) ) ( not ( = ?auto_13994 ?auto_13996 ) ) ( not ( = ?auto_14001 ?auto_14004 ) ) ( not ( = ?auto_14001 ?auto_14003 ) ) ( not ( = ?auto_14001 ?auto_14000 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_13997 ?auto_13995 ?auto_13996 ?auto_13994 ?auto_13993 )
      ( FLY-4PPL-VERIFY ?auto_13994 ?auto_13995 ?auto_13996 ?auto_13997 ?auto_13993 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_14152 - PERSON
      ?auto_14153 - PERSON
      ?auto_14154 - PERSON
      ?auto_14155 - PERSON
      ?auto_14151 - CITY
    )
    :vars
    (
      ?auto_14157 - FLEVEL
      ?auto_14156 - FLEVEL
      ?auto_14159 - CITY
      ?auto_14162 - CITY
      ?auto_14161 - CITY
      ?auto_14158 - CITY
      ?auto_14160 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14157 ?auto_14156 ) ( PERSON-AT ?auto_14153 ?auto_14159 ) ( not ( = ?auto_14151 ?auto_14159 ) ) ( not ( = ?auto_14157 ?auto_14156 ) ) ( PERSON-AT ?auto_14152 ?auto_14162 ) ( not ( = ?auto_14151 ?auto_14162 ) ) ( PERSON-AT ?auto_14155 ?auto_14161 ) ( not ( = ?auto_14151 ?auto_14161 ) ) ( PERSON-AT ?auto_14154 ?auto_14158 ) ( AIRCRAFT-AT ?auto_14160 ?auto_14151 ) ( FUEL-LEVEL ?auto_14160 ?auto_14157 ) ( not ( = ?auto_14151 ?auto_14158 ) ) ( not ( = ?auto_14154 ?auto_14155 ) ) ( not ( = ?auto_14161 ?auto_14158 ) ) ( not ( = ?auto_14154 ?auto_14152 ) ) ( not ( = ?auto_14155 ?auto_14152 ) ) ( not ( = ?auto_14162 ?auto_14161 ) ) ( not ( = ?auto_14162 ?auto_14158 ) ) ( not ( = ?auto_14154 ?auto_14153 ) ) ( not ( = ?auto_14155 ?auto_14153 ) ) ( not ( = ?auto_14152 ?auto_14153 ) ) ( not ( = ?auto_14159 ?auto_14162 ) ) ( not ( = ?auto_14159 ?auto_14161 ) ) ( not ( = ?auto_14159 ?auto_14158 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_14154 ?auto_14155 ?auto_14153 ?auto_14152 ?auto_14151 )
      ( FLY-4PPL-VERIFY ?auto_14152 ?auto_14153 ?auto_14154 ?auto_14155 ?auto_14151 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_14190 - PERSON
      ?auto_14191 - PERSON
      ?auto_14192 - PERSON
      ?auto_14193 - PERSON
      ?auto_14189 - CITY
    )
    :vars
    (
      ?auto_14195 - FLEVEL
      ?auto_14194 - FLEVEL
      ?auto_14197 - CITY
      ?auto_14200 - CITY
      ?auto_14199 - CITY
      ?auto_14196 - CITY
      ?auto_14198 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14195 ?auto_14194 ) ( PERSON-AT ?auto_14191 ?auto_14197 ) ( not ( = ?auto_14189 ?auto_14197 ) ) ( not ( = ?auto_14195 ?auto_14194 ) ) ( PERSON-AT ?auto_14190 ?auto_14200 ) ( not ( = ?auto_14189 ?auto_14200 ) ) ( PERSON-AT ?auto_14192 ?auto_14199 ) ( not ( = ?auto_14189 ?auto_14199 ) ) ( PERSON-AT ?auto_14193 ?auto_14196 ) ( AIRCRAFT-AT ?auto_14198 ?auto_14189 ) ( FUEL-LEVEL ?auto_14198 ?auto_14195 ) ( not ( = ?auto_14189 ?auto_14196 ) ) ( not ( = ?auto_14193 ?auto_14192 ) ) ( not ( = ?auto_14199 ?auto_14196 ) ) ( not ( = ?auto_14193 ?auto_14190 ) ) ( not ( = ?auto_14192 ?auto_14190 ) ) ( not ( = ?auto_14200 ?auto_14199 ) ) ( not ( = ?auto_14200 ?auto_14196 ) ) ( not ( = ?auto_14193 ?auto_14191 ) ) ( not ( = ?auto_14192 ?auto_14191 ) ) ( not ( = ?auto_14190 ?auto_14191 ) ) ( not ( = ?auto_14197 ?auto_14200 ) ) ( not ( = ?auto_14197 ?auto_14199 ) ) ( not ( = ?auto_14197 ?auto_14196 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_14193 ?auto_14192 ?auto_14191 ?auto_14190 ?auto_14189 )
      ( FLY-4PPL-VERIFY ?auto_14190 ?auto_14191 ?auto_14192 ?auto_14193 ?auto_14189 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_14429 - PERSON
      ?auto_14430 - PERSON
      ?auto_14431 - PERSON
      ?auto_14432 - PERSON
      ?auto_14428 - CITY
    )
    :vars
    (
      ?auto_14434 - FLEVEL
      ?auto_14433 - FLEVEL
      ?auto_14436 - CITY
      ?auto_14439 - CITY
      ?auto_14438 - CITY
      ?auto_14435 - CITY
      ?auto_14437 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14434 ?auto_14433 ) ( PERSON-AT ?auto_14429 ?auto_14436 ) ( not ( = ?auto_14428 ?auto_14436 ) ) ( not ( = ?auto_14434 ?auto_14433 ) ) ( PERSON-AT ?auto_14432 ?auto_14439 ) ( not ( = ?auto_14428 ?auto_14439 ) ) ( PERSON-AT ?auto_14431 ?auto_14438 ) ( not ( = ?auto_14428 ?auto_14438 ) ) ( PERSON-AT ?auto_14430 ?auto_14435 ) ( AIRCRAFT-AT ?auto_14437 ?auto_14428 ) ( FUEL-LEVEL ?auto_14437 ?auto_14434 ) ( not ( = ?auto_14428 ?auto_14435 ) ) ( not ( = ?auto_14430 ?auto_14431 ) ) ( not ( = ?auto_14438 ?auto_14435 ) ) ( not ( = ?auto_14430 ?auto_14432 ) ) ( not ( = ?auto_14431 ?auto_14432 ) ) ( not ( = ?auto_14439 ?auto_14438 ) ) ( not ( = ?auto_14439 ?auto_14435 ) ) ( not ( = ?auto_14430 ?auto_14429 ) ) ( not ( = ?auto_14431 ?auto_14429 ) ) ( not ( = ?auto_14432 ?auto_14429 ) ) ( not ( = ?auto_14436 ?auto_14439 ) ) ( not ( = ?auto_14436 ?auto_14438 ) ) ( not ( = ?auto_14436 ?auto_14435 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_14430 ?auto_14431 ?auto_14429 ?auto_14432 ?auto_14428 )
      ( FLY-4PPL-VERIFY ?auto_14429 ?auto_14430 ?auto_14431 ?auto_14432 ?auto_14428 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_14467 - PERSON
      ?auto_14468 - PERSON
      ?auto_14469 - PERSON
      ?auto_14470 - PERSON
      ?auto_14466 - CITY
    )
    :vars
    (
      ?auto_14472 - FLEVEL
      ?auto_14471 - FLEVEL
      ?auto_14474 - CITY
      ?auto_14477 - CITY
      ?auto_14476 - CITY
      ?auto_14473 - CITY
      ?auto_14475 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14472 ?auto_14471 ) ( PERSON-AT ?auto_14467 ?auto_14474 ) ( not ( = ?auto_14466 ?auto_14474 ) ) ( not ( = ?auto_14472 ?auto_14471 ) ) ( PERSON-AT ?auto_14469 ?auto_14477 ) ( not ( = ?auto_14466 ?auto_14477 ) ) ( PERSON-AT ?auto_14470 ?auto_14476 ) ( not ( = ?auto_14466 ?auto_14476 ) ) ( PERSON-AT ?auto_14468 ?auto_14473 ) ( AIRCRAFT-AT ?auto_14475 ?auto_14466 ) ( FUEL-LEVEL ?auto_14475 ?auto_14472 ) ( not ( = ?auto_14466 ?auto_14473 ) ) ( not ( = ?auto_14468 ?auto_14470 ) ) ( not ( = ?auto_14476 ?auto_14473 ) ) ( not ( = ?auto_14468 ?auto_14469 ) ) ( not ( = ?auto_14470 ?auto_14469 ) ) ( not ( = ?auto_14477 ?auto_14476 ) ) ( not ( = ?auto_14477 ?auto_14473 ) ) ( not ( = ?auto_14468 ?auto_14467 ) ) ( not ( = ?auto_14470 ?auto_14467 ) ) ( not ( = ?auto_14469 ?auto_14467 ) ) ( not ( = ?auto_14474 ?auto_14477 ) ) ( not ( = ?auto_14474 ?auto_14476 ) ) ( not ( = ?auto_14474 ?auto_14473 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_14468 ?auto_14470 ?auto_14467 ?auto_14469 ?auto_14466 )
      ( FLY-4PPL-VERIFY ?auto_14467 ?auto_14468 ?auto_14469 ?auto_14470 ?auto_14466 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_14585 - PERSON
      ?auto_14586 - PERSON
      ?auto_14587 - PERSON
      ?auto_14588 - PERSON
      ?auto_14584 - CITY
    )
    :vars
    (
      ?auto_14590 - FLEVEL
      ?auto_14589 - FLEVEL
      ?auto_14592 - CITY
      ?auto_14595 - CITY
      ?auto_14594 - CITY
      ?auto_14591 - CITY
      ?auto_14593 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14590 ?auto_14589 ) ( PERSON-AT ?auto_14585 ?auto_14592 ) ( not ( = ?auto_14584 ?auto_14592 ) ) ( not ( = ?auto_14590 ?auto_14589 ) ) ( PERSON-AT ?auto_14588 ?auto_14595 ) ( not ( = ?auto_14584 ?auto_14595 ) ) ( PERSON-AT ?auto_14586 ?auto_14594 ) ( not ( = ?auto_14584 ?auto_14594 ) ) ( PERSON-AT ?auto_14587 ?auto_14591 ) ( AIRCRAFT-AT ?auto_14593 ?auto_14584 ) ( FUEL-LEVEL ?auto_14593 ?auto_14590 ) ( not ( = ?auto_14584 ?auto_14591 ) ) ( not ( = ?auto_14587 ?auto_14586 ) ) ( not ( = ?auto_14594 ?auto_14591 ) ) ( not ( = ?auto_14587 ?auto_14588 ) ) ( not ( = ?auto_14586 ?auto_14588 ) ) ( not ( = ?auto_14595 ?auto_14594 ) ) ( not ( = ?auto_14595 ?auto_14591 ) ) ( not ( = ?auto_14587 ?auto_14585 ) ) ( not ( = ?auto_14586 ?auto_14585 ) ) ( not ( = ?auto_14588 ?auto_14585 ) ) ( not ( = ?auto_14592 ?auto_14595 ) ) ( not ( = ?auto_14592 ?auto_14594 ) ) ( not ( = ?auto_14592 ?auto_14591 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_14587 ?auto_14586 ?auto_14585 ?auto_14588 ?auto_14584 )
      ( FLY-4PPL-VERIFY ?auto_14585 ?auto_14586 ?auto_14587 ?auto_14588 ?auto_14584 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_14664 - PERSON
      ?auto_14665 - PERSON
      ?auto_14666 - PERSON
      ?auto_14667 - PERSON
      ?auto_14663 - CITY
    )
    :vars
    (
      ?auto_14669 - FLEVEL
      ?auto_14668 - FLEVEL
      ?auto_14671 - CITY
      ?auto_14674 - CITY
      ?auto_14673 - CITY
      ?auto_14670 - CITY
      ?auto_14672 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14669 ?auto_14668 ) ( PERSON-AT ?auto_14664 ?auto_14671 ) ( not ( = ?auto_14663 ?auto_14671 ) ) ( not ( = ?auto_14669 ?auto_14668 ) ) ( PERSON-AT ?auto_14666 ?auto_14674 ) ( not ( = ?auto_14663 ?auto_14674 ) ) ( PERSON-AT ?auto_14665 ?auto_14673 ) ( not ( = ?auto_14663 ?auto_14673 ) ) ( PERSON-AT ?auto_14667 ?auto_14670 ) ( AIRCRAFT-AT ?auto_14672 ?auto_14663 ) ( FUEL-LEVEL ?auto_14672 ?auto_14669 ) ( not ( = ?auto_14663 ?auto_14670 ) ) ( not ( = ?auto_14667 ?auto_14665 ) ) ( not ( = ?auto_14673 ?auto_14670 ) ) ( not ( = ?auto_14667 ?auto_14666 ) ) ( not ( = ?auto_14665 ?auto_14666 ) ) ( not ( = ?auto_14674 ?auto_14673 ) ) ( not ( = ?auto_14674 ?auto_14670 ) ) ( not ( = ?auto_14667 ?auto_14664 ) ) ( not ( = ?auto_14665 ?auto_14664 ) ) ( not ( = ?auto_14666 ?auto_14664 ) ) ( not ( = ?auto_14671 ?auto_14674 ) ) ( not ( = ?auto_14671 ?auto_14673 ) ) ( not ( = ?auto_14671 ?auto_14670 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_14667 ?auto_14665 ?auto_14664 ?auto_14666 ?auto_14663 )
      ( FLY-4PPL-VERIFY ?auto_14664 ?auto_14665 ?auto_14666 ?auto_14667 ?auto_14663 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_14782 - PERSON
      ?auto_14783 - PERSON
      ?auto_14784 - PERSON
      ?auto_14785 - PERSON
      ?auto_14781 - CITY
    )
    :vars
    (
      ?auto_14787 - FLEVEL
      ?auto_14786 - FLEVEL
      ?auto_14789 - CITY
      ?auto_14792 - CITY
      ?auto_14791 - CITY
      ?auto_14788 - CITY
      ?auto_14790 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14787 ?auto_14786 ) ( PERSON-AT ?auto_14782 ?auto_14789 ) ( not ( = ?auto_14781 ?auto_14789 ) ) ( not ( = ?auto_14787 ?auto_14786 ) ) ( PERSON-AT ?auto_14783 ?auto_14792 ) ( not ( = ?auto_14781 ?auto_14792 ) ) ( PERSON-AT ?auto_14785 ?auto_14791 ) ( not ( = ?auto_14781 ?auto_14791 ) ) ( PERSON-AT ?auto_14784 ?auto_14788 ) ( AIRCRAFT-AT ?auto_14790 ?auto_14781 ) ( FUEL-LEVEL ?auto_14790 ?auto_14787 ) ( not ( = ?auto_14781 ?auto_14788 ) ) ( not ( = ?auto_14784 ?auto_14785 ) ) ( not ( = ?auto_14791 ?auto_14788 ) ) ( not ( = ?auto_14784 ?auto_14783 ) ) ( not ( = ?auto_14785 ?auto_14783 ) ) ( not ( = ?auto_14792 ?auto_14791 ) ) ( not ( = ?auto_14792 ?auto_14788 ) ) ( not ( = ?auto_14784 ?auto_14782 ) ) ( not ( = ?auto_14785 ?auto_14782 ) ) ( not ( = ?auto_14783 ?auto_14782 ) ) ( not ( = ?auto_14789 ?auto_14792 ) ) ( not ( = ?auto_14789 ?auto_14791 ) ) ( not ( = ?auto_14789 ?auto_14788 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_14784 ?auto_14785 ?auto_14782 ?auto_14783 ?auto_14781 )
      ( FLY-4PPL-VERIFY ?auto_14782 ?auto_14783 ?auto_14784 ?auto_14785 ?auto_14781 ) )
  )

  ( :method FLY-4PPL
    :parameters
    (
      ?auto_14820 - PERSON
      ?auto_14821 - PERSON
      ?auto_14822 - PERSON
      ?auto_14823 - PERSON
      ?auto_14819 - CITY
    )
    :vars
    (
      ?auto_14825 - FLEVEL
      ?auto_14824 - FLEVEL
      ?auto_14827 - CITY
      ?auto_14830 - CITY
      ?auto_14829 - CITY
      ?auto_14826 - CITY
      ?auto_14828 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14825 ?auto_14824 ) ( PERSON-AT ?auto_14820 ?auto_14827 ) ( not ( = ?auto_14819 ?auto_14827 ) ) ( not ( = ?auto_14825 ?auto_14824 ) ) ( PERSON-AT ?auto_14821 ?auto_14830 ) ( not ( = ?auto_14819 ?auto_14830 ) ) ( PERSON-AT ?auto_14822 ?auto_14829 ) ( not ( = ?auto_14819 ?auto_14829 ) ) ( PERSON-AT ?auto_14823 ?auto_14826 ) ( AIRCRAFT-AT ?auto_14828 ?auto_14819 ) ( FUEL-LEVEL ?auto_14828 ?auto_14825 ) ( not ( = ?auto_14819 ?auto_14826 ) ) ( not ( = ?auto_14823 ?auto_14822 ) ) ( not ( = ?auto_14829 ?auto_14826 ) ) ( not ( = ?auto_14823 ?auto_14821 ) ) ( not ( = ?auto_14822 ?auto_14821 ) ) ( not ( = ?auto_14830 ?auto_14829 ) ) ( not ( = ?auto_14830 ?auto_14826 ) ) ( not ( = ?auto_14823 ?auto_14820 ) ) ( not ( = ?auto_14822 ?auto_14820 ) ) ( not ( = ?auto_14821 ?auto_14820 ) ) ( not ( = ?auto_14827 ?auto_14830 ) ) ( not ( = ?auto_14827 ?auto_14829 ) ) ( not ( = ?auto_14827 ?auto_14826 ) ) )
    :subtasks
    ( ( FLY-4PPL ?auto_14823 ?auto_14822 ?auto_14820 ?auto_14821 ?auto_14819 )
      ( FLY-4PPL-VERIFY ?auto_14820 ?auto_14821 ?auto_14822 ?auto_14823 ?auto_14819 ) )
  )

)

