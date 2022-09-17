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
      ?auto_20603 - PERSON
      ?auto_20602 - CITY
    )
    :vars
    (
      ?auto_20604 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_20603 ?auto_20604 ) ( AIRCRAFT-AT ?auto_20604 ?auto_20602 ) )
    :subtasks
    ( ( !DEBARK ?auto_20603 ?auto_20604 ?auto_20602 )
      ( FLY-1PPL-VERIFY ?auto_20603 ?auto_20602 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_20615 - PERSON
      ?auto_20614 - CITY
    )
    :vars
    (
      ?auto_20616 - AIRCRAFT
      ?auto_20619 - CITY
      ?auto_20617 - FLEVEL
      ?auto_20618 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_20615 ?auto_20616 ) ( AIRCRAFT-AT ?auto_20616 ?auto_20619 ) ( FUEL-LEVEL ?auto_20616 ?auto_20617 ) ( NEXT ?auto_20618 ?auto_20617 ) ( not ( = ?auto_20614 ?auto_20619 ) ) ( not ( = ?auto_20617 ?auto_20618 ) ) )
    :subtasks
    ( ( !FLY ?auto_20616 ?auto_20619 ?auto_20614 ?auto_20617 ?auto_20618 )
      ( FLY-1PPL ?auto_20615 ?auto_20614 )
      ( FLY-1PPL-VERIFY ?auto_20615 ?auto_20614 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_20636 - PERSON
      ?auto_20635 - CITY
    )
    :vars
    (
      ?auto_20640 - AIRCRAFT
      ?auto_20637 - CITY
      ?auto_20639 - FLEVEL
      ?auto_20638 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_20640 ?auto_20637 ) ( FUEL-LEVEL ?auto_20640 ?auto_20639 ) ( NEXT ?auto_20638 ?auto_20639 ) ( not ( = ?auto_20635 ?auto_20637 ) ) ( not ( = ?auto_20639 ?auto_20638 ) ) ( PERSON-AT ?auto_20636 ?auto_20637 ) )
    :subtasks
    ( ( !BOARD ?auto_20636 ?auto_20640 ?auto_20637 )
      ( FLY-1PPL ?auto_20636 ?auto_20635 )
      ( FLY-1PPL-VERIFY ?auto_20636 ?auto_20635 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_20657 - PERSON
      ?auto_20656 - CITY
    )
    :vars
    (
      ?auto_20659 - AIRCRAFT
      ?auto_20660 - CITY
      ?auto_20658 - FLEVEL
      ?auto_20661 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_20659 ?auto_20660 ) ( NEXT ?auto_20658 ?auto_20661 ) ( not ( = ?auto_20656 ?auto_20660 ) ) ( not ( = ?auto_20661 ?auto_20658 ) ) ( PERSON-AT ?auto_20657 ?auto_20660 ) ( FUEL-LEVEL ?auto_20659 ?auto_20658 ) )
    :subtasks
    ( ( !REFUEL ?auto_20659 ?auto_20660 ?auto_20658 ?auto_20661 )
      ( FLY-1PPL ?auto_20657 ?auto_20656 )
      ( FLY-1PPL-VERIFY ?auto_20657 ?auto_20656 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_20678 - PERSON
      ?auto_20677 - CITY
    )
    :vars
    (
      ?auto_20680 - FLEVEL
      ?auto_20682 - FLEVEL
      ?auto_20681 - CITY
      ?auto_20679 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20680 ?auto_20682 ) ( not ( = ?auto_20677 ?auto_20681 ) ) ( not ( = ?auto_20682 ?auto_20680 ) ) ( PERSON-AT ?auto_20678 ?auto_20681 ) ( AIRCRAFT-AT ?auto_20679 ?auto_20677 ) ( FUEL-LEVEL ?auto_20679 ?auto_20682 ) )
    :subtasks
    ( ( !FLY ?auto_20679 ?auto_20677 ?auto_20681 ?auto_20682 ?auto_20680 )
      ( FLY-1PPL ?auto_20678 ?auto_20677 )
      ( FLY-1PPL-VERIFY ?auto_20678 ?auto_20677 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_20699 - PERSON
      ?auto_20698 - CITY
    )
    :vars
    (
      ?auto_20700 - FLEVEL
      ?auto_20702 - FLEVEL
      ?auto_20701 - CITY
      ?auto_20703 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_20700 ?auto_20702 ) ( not ( = ?auto_20698 ?auto_20701 ) ) ( not ( = ?auto_20702 ?auto_20700 ) ) ( PERSON-AT ?auto_20699 ?auto_20701 ) ( AIRCRAFT-AT ?auto_20703 ?auto_20698 ) ( FUEL-LEVEL ?auto_20703 ?auto_20700 ) )
    :subtasks
    ( ( !REFUEL ?auto_20703 ?auto_20698 ?auto_20700 ?auto_20702 )
      ( FLY-1PPL ?auto_20699 ?auto_20698 )
      ( FLY-1PPL-VERIFY ?auto_20699 ?auto_20698 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20762 - PERSON
      ?auto_20763 - PERSON
      ?auto_20761 - CITY
    )
    :vars
    (
      ?auto_20764 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_20763 ?auto_20764 ) ( AIRCRAFT-AT ?auto_20764 ?auto_20761 ) ( PERSON-AT ?auto_20762 ?auto_20761 ) ( not ( = ?auto_20762 ?auto_20763 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_20763 ?auto_20761 )
      ( FLY-2PPL-VERIFY ?auto_20762 ?auto_20763 ?auto_20761 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20766 - PERSON
      ?auto_20767 - PERSON
      ?auto_20765 - CITY
    )
    :vars
    (
      ?auto_20768 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_20766 ?auto_20768 ) ( AIRCRAFT-AT ?auto_20768 ?auto_20765 ) ( PERSON-AT ?auto_20767 ?auto_20765 ) ( not ( = ?auto_20766 ?auto_20767 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_20766 ?auto_20765 )
      ( FLY-2PPL-VERIFY ?auto_20766 ?auto_20767 ?auto_20765 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20774 - PERSON
      ?auto_20775 - PERSON
      ?auto_20776 - PERSON
      ?auto_20773 - CITY
    )
    :vars
    (
      ?auto_20777 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_20776 ?auto_20777 ) ( AIRCRAFT-AT ?auto_20777 ?auto_20773 ) ( PERSON-AT ?auto_20774 ?auto_20773 ) ( PERSON-AT ?auto_20775 ?auto_20773 ) ( not ( = ?auto_20774 ?auto_20775 ) ) ( not ( = ?auto_20774 ?auto_20776 ) ) ( not ( = ?auto_20775 ?auto_20776 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_20776 ?auto_20773 )
      ( FLY-3PPL-VERIFY ?auto_20774 ?auto_20775 ?auto_20776 ?auto_20773 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20779 - PERSON
      ?auto_20780 - PERSON
      ?auto_20781 - PERSON
      ?auto_20778 - CITY
    )
    :vars
    (
      ?auto_20782 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_20780 ?auto_20782 ) ( AIRCRAFT-AT ?auto_20782 ?auto_20778 ) ( PERSON-AT ?auto_20779 ?auto_20778 ) ( PERSON-AT ?auto_20781 ?auto_20778 ) ( not ( = ?auto_20779 ?auto_20780 ) ) ( not ( = ?auto_20779 ?auto_20781 ) ) ( not ( = ?auto_20780 ?auto_20781 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_20780 ?auto_20778 )
      ( FLY-3PPL-VERIFY ?auto_20779 ?auto_20780 ?auto_20781 ?auto_20778 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20789 - PERSON
      ?auto_20790 - PERSON
      ?auto_20791 - PERSON
      ?auto_20788 - CITY
    )
    :vars
    (
      ?auto_20792 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_20789 ?auto_20792 ) ( AIRCRAFT-AT ?auto_20792 ?auto_20788 ) ( PERSON-AT ?auto_20790 ?auto_20788 ) ( PERSON-AT ?auto_20791 ?auto_20788 ) ( not ( = ?auto_20789 ?auto_20790 ) ) ( not ( = ?auto_20789 ?auto_20791 ) ) ( not ( = ?auto_20790 ?auto_20791 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_20789 ?auto_20788 )
      ( FLY-3PPL-VERIFY ?auto_20789 ?auto_20790 ?auto_20791 ?auto_20788 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20815 - PERSON
      ?auto_20816 - PERSON
      ?auto_20814 - CITY
    )
    :vars
    (
      ?auto_20817 - AIRCRAFT
      ?auto_20818 - CITY
      ?auto_20820 - FLEVEL
      ?auto_20819 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_20816 ?auto_20817 ) ( AIRCRAFT-AT ?auto_20817 ?auto_20818 ) ( FUEL-LEVEL ?auto_20817 ?auto_20820 ) ( NEXT ?auto_20819 ?auto_20820 ) ( not ( = ?auto_20814 ?auto_20818 ) ) ( not ( = ?auto_20820 ?auto_20819 ) ) ( PERSON-AT ?auto_20815 ?auto_20814 ) ( not ( = ?auto_20815 ?auto_20816 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_20816 ?auto_20814 )
      ( FLY-2PPL-VERIFY ?auto_20815 ?auto_20816 ?auto_20814 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20822 - PERSON
      ?auto_20823 - PERSON
      ?auto_20821 - CITY
    )
    :vars
    (
      ?auto_20825 - AIRCRAFT
      ?auto_20826 - CITY
      ?auto_20827 - FLEVEL
      ?auto_20824 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_20822 ?auto_20825 ) ( AIRCRAFT-AT ?auto_20825 ?auto_20826 ) ( FUEL-LEVEL ?auto_20825 ?auto_20827 ) ( NEXT ?auto_20824 ?auto_20827 ) ( not ( = ?auto_20821 ?auto_20826 ) ) ( not ( = ?auto_20827 ?auto_20824 ) ) ( PERSON-AT ?auto_20823 ?auto_20821 ) ( not ( = ?auto_20823 ?auto_20822 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20823 ?auto_20822 ?auto_20821 )
      ( FLY-2PPL-VERIFY ?auto_20822 ?auto_20823 ?auto_20821 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20837 - PERSON
      ?auto_20838 - PERSON
      ?auto_20839 - PERSON
      ?auto_20836 - CITY
    )
    :vars
    (
      ?auto_20841 - AIRCRAFT
      ?auto_20842 - CITY
      ?auto_20843 - FLEVEL
      ?auto_20840 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_20839 ?auto_20841 ) ( AIRCRAFT-AT ?auto_20841 ?auto_20842 ) ( FUEL-LEVEL ?auto_20841 ?auto_20843 ) ( NEXT ?auto_20840 ?auto_20843 ) ( not ( = ?auto_20836 ?auto_20842 ) ) ( not ( = ?auto_20843 ?auto_20840 ) ) ( PERSON-AT ?auto_20838 ?auto_20836 ) ( not ( = ?auto_20838 ?auto_20839 ) ) ( PERSON-AT ?auto_20837 ?auto_20836 ) ( not ( = ?auto_20837 ?auto_20838 ) ) ( not ( = ?auto_20837 ?auto_20839 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20838 ?auto_20839 ?auto_20836 )
      ( FLY-3PPL-VERIFY ?auto_20837 ?auto_20838 ?auto_20839 ?auto_20836 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20845 - PERSON
      ?auto_20846 - PERSON
      ?auto_20847 - PERSON
      ?auto_20844 - CITY
    )
    :vars
    (
      ?auto_20849 - AIRCRAFT
      ?auto_20850 - CITY
      ?auto_20851 - FLEVEL
      ?auto_20848 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_20846 ?auto_20849 ) ( AIRCRAFT-AT ?auto_20849 ?auto_20850 ) ( FUEL-LEVEL ?auto_20849 ?auto_20851 ) ( NEXT ?auto_20848 ?auto_20851 ) ( not ( = ?auto_20844 ?auto_20850 ) ) ( not ( = ?auto_20851 ?auto_20848 ) ) ( PERSON-AT ?auto_20847 ?auto_20844 ) ( not ( = ?auto_20847 ?auto_20846 ) ) ( PERSON-AT ?auto_20845 ?auto_20844 ) ( not ( = ?auto_20845 ?auto_20846 ) ) ( not ( = ?auto_20845 ?auto_20847 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20847 ?auto_20846 ?auto_20844 )
      ( FLY-3PPL-VERIFY ?auto_20845 ?auto_20846 ?auto_20847 ?auto_20844 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20861 - PERSON
      ?auto_20862 - PERSON
      ?auto_20863 - PERSON
      ?auto_20860 - CITY
    )
    :vars
    (
      ?auto_20865 - AIRCRAFT
      ?auto_20866 - CITY
      ?auto_20867 - FLEVEL
      ?auto_20864 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_20861 ?auto_20865 ) ( AIRCRAFT-AT ?auto_20865 ?auto_20866 ) ( FUEL-LEVEL ?auto_20865 ?auto_20867 ) ( NEXT ?auto_20864 ?auto_20867 ) ( not ( = ?auto_20860 ?auto_20866 ) ) ( not ( = ?auto_20867 ?auto_20864 ) ) ( PERSON-AT ?auto_20862 ?auto_20860 ) ( not ( = ?auto_20862 ?auto_20861 ) ) ( PERSON-AT ?auto_20863 ?auto_20860 ) ( not ( = ?auto_20861 ?auto_20863 ) ) ( not ( = ?auto_20862 ?auto_20863 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20862 ?auto_20861 ?auto_20860 )
      ( FLY-3PPL-VERIFY ?auto_20861 ?auto_20862 ?auto_20863 ?auto_20860 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_20894 - PERSON
      ?auto_20893 - CITY
    )
    :vars
    (
      ?auto_20896 - AIRCRAFT
      ?auto_20897 - CITY
      ?auto_20898 - FLEVEL
      ?auto_20895 - FLEVEL
      ?auto_20899 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_20896 ?auto_20897 ) ( FUEL-LEVEL ?auto_20896 ?auto_20898 ) ( NEXT ?auto_20895 ?auto_20898 ) ( not ( = ?auto_20893 ?auto_20897 ) ) ( not ( = ?auto_20898 ?auto_20895 ) ) ( PERSON-AT ?auto_20899 ?auto_20893 ) ( not ( = ?auto_20899 ?auto_20894 ) ) ( PERSON-AT ?auto_20894 ?auto_20897 ) )
    :subtasks
    ( ( !BOARD ?auto_20894 ?auto_20896 ?auto_20897 )
      ( FLY-2PPL ?auto_20899 ?auto_20894 ?auto_20893 )
      ( FLY-1PPL-VERIFY ?auto_20894 ?auto_20893 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20901 - PERSON
      ?auto_20902 - PERSON
      ?auto_20900 - CITY
    )
    :vars
    (
      ?auto_20906 - AIRCRAFT
      ?auto_20905 - CITY
      ?auto_20903 - FLEVEL
      ?auto_20904 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_20906 ?auto_20905 ) ( FUEL-LEVEL ?auto_20906 ?auto_20903 ) ( NEXT ?auto_20904 ?auto_20903 ) ( not ( = ?auto_20900 ?auto_20905 ) ) ( not ( = ?auto_20903 ?auto_20904 ) ) ( PERSON-AT ?auto_20901 ?auto_20900 ) ( not ( = ?auto_20901 ?auto_20902 ) ) ( PERSON-AT ?auto_20902 ?auto_20905 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_20902 ?auto_20900 )
      ( FLY-2PPL-VERIFY ?auto_20901 ?auto_20902 ?auto_20900 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20908 - PERSON
      ?auto_20909 - PERSON
      ?auto_20907 - CITY
    )
    :vars
    (
      ?auto_20913 - AIRCRAFT
      ?auto_20912 - CITY
      ?auto_20911 - FLEVEL
      ?auto_20910 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_20913 ?auto_20912 ) ( FUEL-LEVEL ?auto_20913 ?auto_20911 ) ( NEXT ?auto_20910 ?auto_20911 ) ( not ( = ?auto_20907 ?auto_20912 ) ) ( not ( = ?auto_20911 ?auto_20910 ) ) ( PERSON-AT ?auto_20909 ?auto_20907 ) ( not ( = ?auto_20909 ?auto_20908 ) ) ( PERSON-AT ?auto_20908 ?auto_20912 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20909 ?auto_20908 ?auto_20907 )
      ( FLY-2PPL-VERIFY ?auto_20908 ?auto_20909 ?auto_20907 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20923 - PERSON
      ?auto_20924 - PERSON
      ?auto_20925 - PERSON
      ?auto_20922 - CITY
    )
    :vars
    (
      ?auto_20929 - AIRCRAFT
      ?auto_20928 - CITY
      ?auto_20927 - FLEVEL
      ?auto_20926 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_20929 ?auto_20928 ) ( FUEL-LEVEL ?auto_20929 ?auto_20927 ) ( NEXT ?auto_20926 ?auto_20927 ) ( not ( = ?auto_20922 ?auto_20928 ) ) ( not ( = ?auto_20927 ?auto_20926 ) ) ( PERSON-AT ?auto_20923 ?auto_20922 ) ( not ( = ?auto_20923 ?auto_20925 ) ) ( PERSON-AT ?auto_20925 ?auto_20928 ) ( PERSON-AT ?auto_20924 ?auto_20922 ) ( not ( = ?auto_20923 ?auto_20924 ) ) ( not ( = ?auto_20924 ?auto_20925 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20923 ?auto_20925 ?auto_20922 )
      ( FLY-3PPL-VERIFY ?auto_20923 ?auto_20924 ?auto_20925 ?auto_20922 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20931 - PERSON
      ?auto_20932 - PERSON
      ?auto_20933 - PERSON
      ?auto_20930 - CITY
    )
    :vars
    (
      ?auto_20937 - AIRCRAFT
      ?auto_20936 - CITY
      ?auto_20935 - FLEVEL
      ?auto_20934 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_20937 ?auto_20936 ) ( FUEL-LEVEL ?auto_20937 ?auto_20935 ) ( NEXT ?auto_20934 ?auto_20935 ) ( not ( = ?auto_20930 ?auto_20936 ) ) ( not ( = ?auto_20935 ?auto_20934 ) ) ( PERSON-AT ?auto_20933 ?auto_20930 ) ( not ( = ?auto_20933 ?auto_20932 ) ) ( PERSON-AT ?auto_20932 ?auto_20936 ) ( PERSON-AT ?auto_20931 ?auto_20930 ) ( not ( = ?auto_20931 ?auto_20932 ) ) ( not ( = ?auto_20931 ?auto_20933 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20933 ?auto_20932 ?auto_20930 )
      ( FLY-3PPL-VERIFY ?auto_20931 ?auto_20932 ?auto_20933 ?auto_20930 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_20947 - PERSON
      ?auto_20948 - PERSON
      ?auto_20949 - PERSON
      ?auto_20946 - CITY
    )
    :vars
    (
      ?auto_20953 - AIRCRAFT
      ?auto_20952 - CITY
      ?auto_20951 - FLEVEL
      ?auto_20950 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_20953 ?auto_20952 ) ( FUEL-LEVEL ?auto_20953 ?auto_20951 ) ( NEXT ?auto_20950 ?auto_20951 ) ( not ( = ?auto_20946 ?auto_20952 ) ) ( not ( = ?auto_20951 ?auto_20950 ) ) ( PERSON-AT ?auto_20948 ?auto_20946 ) ( not ( = ?auto_20948 ?auto_20947 ) ) ( PERSON-AT ?auto_20947 ?auto_20952 ) ( PERSON-AT ?auto_20949 ?auto_20946 ) ( not ( = ?auto_20947 ?auto_20949 ) ) ( not ( = ?auto_20948 ?auto_20949 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20948 ?auto_20947 ?auto_20946 )
      ( FLY-3PPL-VERIFY ?auto_20947 ?auto_20948 ?auto_20949 ?auto_20946 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_20980 - PERSON
      ?auto_20979 - CITY
    )
    :vars
    (
      ?auto_20985 - AIRCRAFT
      ?auto_20984 - CITY
      ?auto_20982 - FLEVEL
      ?auto_20983 - FLEVEL
      ?auto_20981 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_20985 ?auto_20984 ) ( NEXT ?auto_20982 ?auto_20983 ) ( not ( = ?auto_20979 ?auto_20984 ) ) ( not ( = ?auto_20983 ?auto_20982 ) ) ( PERSON-AT ?auto_20981 ?auto_20979 ) ( not ( = ?auto_20981 ?auto_20980 ) ) ( PERSON-AT ?auto_20980 ?auto_20984 ) ( FUEL-LEVEL ?auto_20985 ?auto_20982 ) )
    :subtasks
    ( ( !REFUEL ?auto_20985 ?auto_20984 ?auto_20982 ?auto_20983 )
      ( FLY-2PPL ?auto_20981 ?auto_20980 ?auto_20979 )
      ( FLY-1PPL-VERIFY ?auto_20980 ?auto_20979 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20987 - PERSON
      ?auto_20988 - PERSON
      ?auto_20986 - CITY
    )
    :vars
    (
      ?auto_20989 - AIRCRAFT
      ?auto_20992 - CITY
      ?auto_20991 - FLEVEL
      ?auto_20990 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_20989 ?auto_20992 ) ( NEXT ?auto_20991 ?auto_20990 ) ( not ( = ?auto_20986 ?auto_20992 ) ) ( not ( = ?auto_20990 ?auto_20991 ) ) ( PERSON-AT ?auto_20987 ?auto_20986 ) ( not ( = ?auto_20987 ?auto_20988 ) ) ( PERSON-AT ?auto_20988 ?auto_20992 ) ( FUEL-LEVEL ?auto_20989 ?auto_20991 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_20988 ?auto_20986 )
      ( FLY-2PPL-VERIFY ?auto_20987 ?auto_20988 ?auto_20986 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_20994 - PERSON
      ?auto_20995 - PERSON
      ?auto_20993 - CITY
    )
    :vars
    (
      ?auto_20999 - AIRCRAFT
      ?auto_20998 - CITY
      ?auto_20997 - FLEVEL
      ?auto_20996 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_20999 ?auto_20998 ) ( NEXT ?auto_20997 ?auto_20996 ) ( not ( = ?auto_20993 ?auto_20998 ) ) ( not ( = ?auto_20996 ?auto_20997 ) ) ( PERSON-AT ?auto_20995 ?auto_20993 ) ( not ( = ?auto_20995 ?auto_20994 ) ) ( PERSON-AT ?auto_20994 ?auto_20998 ) ( FUEL-LEVEL ?auto_20999 ?auto_20997 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_20995 ?auto_20994 ?auto_20993 )
      ( FLY-2PPL-VERIFY ?auto_20994 ?auto_20995 ?auto_20993 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21009 - PERSON
      ?auto_21010 - PERSON
      ?auto_21011 - PERSON
      ?auto_21008 - CITY
    )
    :vars
    (
      ?auto_21015 - AIRCRAFT
      ?auto_21014 - CITY
      ?auto_21013 - FLEVEL
      ?auto_21012 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_21015 ?auto_21014 ) ( NEXT ?auto_21013 ?auto_21012 ) ( not ( = ?auto_21008 ?auto_21014 ) ) ( not ( = ?auto_21012 ?auto_21013 ) ) ( PERSON-AT ?auto_21009 ?auto_21008 ) ( not ( = ?auto_21009 ?auto_21011 ) ) ( PERSON-AT ?auto_21011 ?auto_21014 ) ( FUEL-LEVEL ?auto_21015 ?auto_21013 ) ( PERSON-AT ?auto_21010 ?auto_21008 ) ( not ( = ?auto_21009 ?auto_21010 ) ) ( not ( = ?auto_21010 ?auto_21011 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21009 ?auto_21011 ?auto_21008 )
      ( FLY-3PPL-VERIFY ?auto_21009 ?auto_21010 ?auto_21011 ?auto_21008 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21017 - PERSON
      ?auto_21018 - PERSON
      ?auto_21019 - PERSON
      ?auto_21016 - CITY
    )
    :vars
    (
      ?auto_21023 - AIRCRAFT
      ?auto_21022 - CITY
      ?auto_21021 - FLEVEL
      ?auto_21020 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_21023 ?auto_21022 ) ( NEXT ?auto_21021 ?auto_21020 ) ( not ( = ?auto_21016 ?auto_21022 ) ) ( not ( = ?auto_21020 ?auto_21021 ) ) ( PERSON-AT ?auto_21017 ?auto_21016 ) ( not ( = ?auto_21017 ?auto_21018 ) ) ( PERSON-AT ?auto_21018 ?auto_21022 ) ( FUEL-LEVEL ?auto_21023 ?auto_21021 ) ( PERSON-AT ?auto_21019 ?auto_21016 ) ( not ( = ?auto_21017 ?auto_21019 ) ) ( not ( = ?auto_21018 ?auto_21019 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21017 ?auto_21018 ?auto_21016 )
      ( FLY-3PPL-VERIFY ?auto_21017 ?auto_21018 ?auto_21019 ?auto_21016 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21033 - PERSON
      ?auto_21034 - PERSON
      ?auto_21035 - PERSON
      ?auto_21032 - CITY
    )
    :vars
    (
      ?auto_21039 - AIRCRAFT
      ?auto_21038 - CITY
      ?auto_21037 - FLEVEL
      ?auto_21036 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_21039 ?auto_21038 ) ( NEXT ?auto_21037 ?auto_21036 ) ( not ( = ?auto_21032 ?auto_21038 ) ) ( not ( = ?auto_21036 ?auto_21037 ) ) ( PERSON-AT ?auto_21034 ?auto_21032 ) ( not ( = ?auto_21034 ?auto_21033 ) ) ( PERSON-AT ?auto_21033 ?auto_21038 ) ( FUEL-LEVEL ?auto_21039 ?auto_21037 ) ( PERSON-AT ?auto_21035 ?auto_21032 ) ( not ( = ?auto_21033 ?auto_21035 ) ) ( not ( = ?auto_21034 ?auto_21035 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21034 ?auto_21033 ?auto_21032 )
      ( FLY-3PPL-VERIFY ?auto_21033 ?auto_21034 ?auto_21035 ?auto_21032 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_21066 - PERSON
      ?auto_21065 - CITY
    )
    :vars
    (
      ?auto_21068 - FLEVEL
      ?auto_21067 - FLEVEL
      ?auto_21069 - CITY
      ?auto_21070 - PERSON
      ?auto_21071 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21068 ?auto_21067 ) ( not ( = ?auto_21065 ?auto_21069 ) ) ( not ( = ?auto_21067 ?auto_21068 ) ) ( PERSON-AT ?auto_21070 ?auto_21065 ) ( not ( = ?auto_21070 ?auto_21066 ) ) ( PERSON-AT ?auto_21066 ?auto_21069 ) ( AIRCRAFT-AT ?auto_21071 ?auto_21065 ) ( FUEL-LEVEL ?auto_21071 ?auto_21067 ) )
    :subtasks
    ( ( !FLY ?auto_21071 ?auto_21065 ?auto_21069 ?auto_21067 ?auto_21068 )
      ( FLY-2PPL ?auto_21070 ?auto_21066 ?auto_21065 )
      ( FLY-1PPL-VERIFY ?auto_21066 ?auto_21065 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21073 - PERSON
      ?auto_21074 - PERSON
      ?auto_21072 - CITY
    )
    :vars
    (
      ?auto_21076 - FLEVEL
      ?auto_21077 - FLEVEL
      ?auto_21075 - CITY
      ?auto_21078 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21076 ?auto_21077 ) ( not ( = ?auto_21072 ?auto_21075 ) ) ( not ( = ?auto_21077 ?auto_21076 ) ) ( PERSON-AT ?auto_21073 ?auto_21072 ) ( not ( = ?auto_21073 ?auto_21074 ) ) ( PERSON-AT ?auto_21074 ?auto_21075 ) ( AIRCRAFT-AT ?auto_21078 ?auto_21072 ) ( FUEL-LEVEL ?auto_21078 ?auto_21077 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_21074 ?auto_21072 )
      ( FLY-2PPL-VERIFY ?auto_21073 ?auto_21074 ?auto_21072 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21080 - PERSON
      ?auto_21081 - PERSON
      ?auto_21079 - CITY
    )
    :vars
    (
      ?auto_21082 - FLEVEL
      ?auto_21084 - FLEVEL
      ?auto_21085 - CITY
      ?auto_21083 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21082 ?auto_21084 ) ( not ( = ?auto_21079 ?auto_21085 ) ) ( not ( = ?auto_21084 ?auto_21082 ) ) ( PERSON-AT ?auto_21081 ?auto_21079 ) ( not ( = ?auto_21081 ?auto_21080 ) ) ( PERSON-AT ?auto_21080 ?auto_21085 ) ( AIRCRAFT-AT ?auto_21083 ?auto_21079 ) ( FUEL-LEVEL ?auto_21083 ?auto_21084 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21081 ?auto_21080 ?auto_21079 )
      ( FLY-2PPL-VERIFY ?auto_21080 ?auto_21081 ?auto_21079 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21095 - PERSON
      ?auto_21096 - PERSON
      ?auto_21097 - PERSON
      ?auto_21094 - CITY
    )
    :vars
    (
      ?auto_21098 - FLEVEL
      ?auto_21100 - FLEVEL
      ?auto_21101 - CITY
      ?auto_21099 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21098 ?auto_21100 ) ( not ( = ?auto_21094 ?auto_21101 ) ) ( not ( = ?auto_21100 ?auto_21098 ) ) ( PERSON-AT ?auto_21095 ?auto_21094 ) ( not ( = ?auto_21095 ?auto_21097 ) ) ( PERSON-AT ?auto_21097 ?auto_21101 ) ( AIRCRAFT-AT ?auto_21099 ?auto_21094 ) ( FUEL-LEVEL ?auto_21099 ?auto_21100 ) ( PERSON-AT ?auto_21096 ?auto_21094 ) ( not ( = ?auto_21095 ?auto_21096 ) ) ( not ( = ?auto_21096 ?auto_21097 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21095 ?auto_21097 ?auto_21094 )
      ( FLY-3PPL-VERIFY ?auto_21095 ?auto_21096 ?auto_21097 ?auto_21094 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21103 - PERSON
      ?auto_21104 - PERSON
      ?auto_21105 - PERSON
      ?auto_21102 - CITY
    )
    :vars
    (
      ?auto_21106 - FLEVEL
      ?auto_21108 - FLEVEL
      ?auto_21109 - CITY
      ?auto_21107 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21106 ?auto_21108 ) ( not ( = ?auto_21102 ?auto_21109 ) ) ( not ( = ?auto_21108 ?auto_21106 ) ) ( PERSON-AT ?auto_21103 ?auto_21102 ) ( not ( = ?auto_21103 ?auto_21104 ) ) ( PERSON-AT ?auto_21104 ?auto_21109 ) ( AIRCRAFT-AT ?auto_21107 ?auto_21102 ) ( FUEL-LEVEL ?auto_21107 ?auto_21108 ) ( PERSON-AT ?auto_21105 ?auto_21102 ) ( not ( = ?auto_21103 ?auto_21105 ) ) ( not ( = ?auto_21104 ?auto_21105 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21103 ?auto_21104 ?auto_21102 )
      ( FLY-3PPL-VERIFY ?auto_21103 ?auto_21104 ?auto_21105 ?auto_21102 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21119 - PERSON
      ?auto_21120 - PERSON
      ?auto_21121 - PERSON
      ?auto_21118 - CITY
    )
    :vars
    (
      ?auto_21122 - FLEVEL
      ?auto_21124 - FLEVEL
      ?auto_21125 - CITY
      ?auto_21123 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21122 ?auto_21124 ) ( not ( = ?auto_21118 ?auto_21125 ) ) ( not ( = ?auto_21124 ?auto_21122 ) ) ( PERSON-AT ?auto_21121 ?auto_21118 ) ( not ( = ?auto_21121 ?auto_21119 ) ) ( PERSON-AT ?auto_21119 ?auto_21125 ) ( AIRCRAFT-AT ?auto_21123 ?auto_21118 ) ( FUEL-LEVEL ?auto_21123 ?auto_21124 ) ( PERSON-AT ?auto_21120 ?auto_21118 ) ( not ( = ?auto_21119 ?auto_21120 ) ) ( not ( = ?auto_21120 ?auto_21121 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21121 ?auto_21119 ?auto_21118 )
      ( FLY-3PPL-VERIFY ?auto_21119 ?auto_21120 ?auto_21121 ?auto_21118 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_21152 - PERSON
      ?auto_21151 - CITY
    )
    :vars
    (
      ?auto_21154 - FLEVEL
      ?auto_21156 - FLEVEL
      ?auto_21157 - CITY
      ?auto_21153 - PERSON
      ?auto_21155 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21154 ?auto_21156 ) ( not ( = ?auto_21151 ?auto_21157 ) ) ( not ( = ?auto_21156 ?auto_21154 ) ) ( PERSON-AT ?auto_21153 ?auto_21151 ) ( not ( = ?auto_21153 ?auto_21152 ) ) ( PERSON-AT ?auto_21152 ?auto_21157 ) ( AIRCRAFT-AT ?auto_21155 ?auto_21151 ) ( FUEL-LEVEL ?auto_21155 ?auto_21154 ) )
    :subtasks
    ( ( !REFUEL ?auto_21155 ?auto_21151 ?auto_21154 ?auto_21156 )
      ( FLY-2PPL ?auto_21153 ?auto_21152 ?auto_21151 )
      ( FLY-1PPL-VERIFY ?auto_21152 ?auto_21151 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21159 - PERSON
      ?auto_21160 - PERSON
      ?auto_21158 - CITY
    )
    :vars
    (
      ?auto_21162 - FLEVEL
      ?auto_21161 - FLEVEL
      ?auto_21163 - CITY
      ?auto_21164 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21162 ?auto_21161 ) ( not ( = ?auto_21158 ?auto_21163 ) ) ( not ( = ?auto_21161 ?auto_21162 ) ) ( PERSON-AT ?auto_21159 ?auto_21158 ) ( not ( = ?auto_21159 ?auto_21160 ) ) ( PERSON-AT ?auto_21160 ?auto_21163 ) ( AIRCRAFT-AT ?auto_21164 ?auto_21158 ) ( FUEL-LEVEL ?auto_21164 ?auto_21162 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_21160 ?auto_21158 )
      ( FLY-2PPL-VERIFY ?auto_21159 ?auto_21160 ?auto_21158 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21166 - PERSON
      ?auto_21167 - PERSON
      ?auto_21165 - CITY
    )
    :vars
    (
      ?auto_21171 - FLEVEL
      ?auto_21169 - FLEVEL
      ?auto_21170 - CITY
      ?auto_21168 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21171 ?auto_21169 ) ( not ( = ?auto_21165 ?auto_21170 ) ) ( not ( = ?auto_21169 ?auto_21171 ) ) ( PERSON-AT ?auto_21167 ?auto_21165 ) ( not ( = ?auto_21167 ?auto_21166 ) ) ( PERSON-AT ?auto_21166 ?auto_21170 ) ( AIRCRAFT-AT ?auto_21168 ?auto_21165 ) ( FUEL-LEVEL ?auto_21168 ?auto_21171 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21167 ?auto_21166 ?auto_21165 )
      ( FLY-2PPL-VERIFY ?auto_21166 ?auto_21167 ?auto_21165 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21181 - PERSON
      ?auto_21182 - PERSON
      ?auto_21183 - PERSON
      ?auto_21180 - CITY
    )
    :vars
    (
      ?auto_21187 - FLEVEL
      ?auto_21185 - FLEVEL
      ?auto_21186 - CITY
      ?auto_21184 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21187 ?auto_21185 ) ( not ( = ?auto_21180 ?auto_21186 ) ) ( not ( = ?auto_21185 ?auto_21187 ) ) ( PERSON-AT ?auto_21181 ?auto_21180 ) ( not ( = ?auto_21181 ?auto_21183 ) ) ( PERSON-AT ?auto_21183 ?auto_21186 ) ( AIRCRAFT-AT ?auto_21184 ?auto_21180 ) ( FUEL-LEVEL ?auto_21184 ?auto_21187 ) ( PERSON-AT ?auto_21182 ?auto_21180 ) ( not ( = ?auto_21181 ?auto_21182 ) ) ( not ( = ?auto_21182 ?auto_21183 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21181 ?auto_21183 ?auto_21180 )
      ( FLY-3PPL-VERIFY ?auto_21181 ?auto_21182 ?auto_21183 ?auto_21180 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21189 - PERSON
      ?auto_21190 - PERSON
      ?auto_21191 - PERSON
      ?auto_21188 - CITY
    )
    :vars
    (
      ?auto_21195 - FLEVEL
      ?auto_21193 - FLEVEL
      ?auto_21194 - CITY
      ?auto_21192 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21195 ?auto_21193 ) ( not ( = ?auto_21188 ?auto_21194 ) ) ( not ( = ?auto_21193 ?auto_21195 ) ) ( PERSON-AT ?auto_21191 ?auto_21188 ) ( not ( = ?auto_21191 ?auto_21190 ) ) ( PERSON-AT ?auto_21190 ?auto_21194 ) ( AIRCRAFT-AT ?auto_21192 ?auto_21188 ) ( FUEL-LEVEL ?auto_21192 ?auto_21195 ) ( PERSON-AT ?auto_21189 ?auto_21188 ) ( not ( = ?auto_21189 ?auto_21190 ) ) ( not ( = ?auto_21189 ?auto_21191 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21191 ?auto_21190 ?auto_21188 )
      ( FLY-3PPL-VERIFY ?auto_21189 ?auto_21190 ?auto_21191 ?auto_21188 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_21205 - PERSON
      ?auto_21206 - PERSON
      ?auto_21207 - PERSON
      ?auto_21204 - CITY
    )
    :vars
    (
      ?auto_21211 - FLEVEL
      ?auto_21209 - FLEVEL
      ?auto_21210 - CITY
      ?auto_21208 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21211 ?auto_21209 ) ( not ( = ?auto_21204 ?auto_21210 ) ) ( not ( = ?auto_21209 ?auto_21211 ) ) ( PERSON-AT ?auto_21207 ?auto_21204 ) ( not ( = ?auto_21207 ?auto_21205 ) ) ( PERSON-AT ?auto_21205 ?auto_21210 ) ( AIRCRAFT-AT ?auto_21208 ?auto_21204 ) ( FUEL-LEVEL ?auto_21208 ?auto_21211 ) ( PERSON-AT ?auto_21206 ?auto_21204 ) ( not ( = ?auto_21205 ?auto_21206 ) ) ( not ( = ?auto_21206 ?auto_21207 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21207 ?auto_21205 ?auto_21204 )
      ( FLY-3PPL-VERIFY ?auto_21205 ?auto_21206 ?auto_21207 ?auto_21204 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_21238 - PERSON
      ?auto_21237 - CITY
    )
    :vars
    (
      ?auto_21242 - FLEVEL
      ?auto_21240 - FLEVEL
      ?auto_21241 - CITY
      ?auto_21243 - PERSON
      ?auto_21239 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21242 ?auto_21240 ) ( not ( = ?auto_21237 ?auto_21241 ) ) ( not ( = ?auto_21240 ?auto_21242 ) ) ( not ( = ?auto_21243 ?auto_21238 ) ) ( PERSON-AT ?auto_21238 ?auto_21241 ) ( AIRCRAFT-AT ?auto_21239 ?auto_21237 ) ( FUEL-LEVEL ?auto_21239 ?auto_21242 ) ( IN ?auto_21243 ?auto_21239 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_21243 ?auto_21237 )
      ( FLY-2PPL ?auto_21243 ?auto_21238 ?auto_21237 )
      ( FLY-1PPL-VERIFY ?auto_21238 ?auto_21237 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21245 - PERSON
      ?auto_21246 - PERSON
      ?auto_21244 - CITY
    )
    :vars
    (
      ?auto_21247 - FLEVEL
      ?auto_21249 - FLEVEL
      ?auto_21248 - CITY
      ?auto_21250 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21247 ?auto_21249 ) ( not ( = ?auto_21244 ?auto_21248 ) ) ( not ( = ?auto_21249 ?auto_21247 ) ) ( not ( = ?auto_21245 ?auto_21246 ) ) ( PERSON-AT ?auto_21246 ?auto_21248 ) ( AIRCRAFT-AT ?auto_21250 ?auto_21244 ) ( FUEL-LEVEL ?auto_21250 ?auto_21247 ) ( IN ?auto_21245 ?auto_21250 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_21246 ?auto_21244 )
      ( FLY-2PPL-VERIFY ?auto_21245 ?auto_21246 ?auto_21244 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21252 - PERSON
      ?auto_21253 - PERSON
      ?auto_21251 - CITY
    )
    :vars
    (
      ?auto_21255 - FLEVEL
      ?auto_21254 - FLEVEL
      ?auto_21256 - CITY
      ?auto_21257 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_21255 ?auto_21254 ) ( not ( = ?auto_21251 ?auto_21256 ) ) ( not ( = ?auto_21254 ?auto_21255 ) ) ( not ( = ?auto_21253 ?auto_21252 ) ) ( PERSON-AT ?auto_21252 ?auto_21256 ) ( AIRCRAFT-AT ?auto_21257 ?auto_21251 ) ( FUEL-LEVEL ?auto_21257 ?auto_21255 ) ( IN ?auto_21253 ?auto_21257 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21253 ?auto_21252 ?auto_21251 )
      ( FLY-2PPL-VERIFY ?auto_21252 ?auto_21253 ?auto_21251 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_21324 - PERSON
      ?auto_21323 - CITY
    )
    :vars
    (
      ?auto_21326 - FLEVEL
      ?auto_21325 - FLEVEL
      ?auto_21327 - CITY
      ?auto_21329 - PERSON
      ?auto_21328 - AIRCRAFT
      ?auto_21330 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21326 ?auto_21325 ) ( not ( = ?auto_21323 ?auto_21327 ) ) ( not ( = ?auto_21325 ?auto_21326 ) ) ( not ( = ?auto_21329 ?auto_21324 ) ) ( PERSON-AT ?auto_21324 ?auto_21327 ) ( IN ?auto_21329 ?auto_21328 ) ( AIRCRAFT-AT ?auto_21328 ?auto_21330 ) ( FUEL-LEVEL ?auto_21328 ?auto_21325 ) ( not ( = ?auto_21323 ?auto_21330 ) ) ( not ( = ?auto_21327 ?auto_21330 ) ) )
    :subtasks
    ( ( !FLY ?auto_21328 ?auto_21330 ?auto_21323 ?auto_21325 ?auto_21326 )
      ( FLY-2PPL ?auto_21329 ?auto_21324 ?auto_21323 )
      ( FLY-1PPL-VERIFY ?auto_21324 ?auto_21323 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21332 - PERSON
      ?auto_21333 - PERSON
      ?auto_21331 - CITY
    )
    :vars
    (
      ?auto_21335 - FLEVEL
      ?auto_21337 - FLEVEL
      ?auto_21338 - CITY
      ?auto_21336 - AIRCRAFT
      ?auto_21334 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21335 ?auto_21337 ) ( not ( = ?auto_21331 ?auto_21338 ) ) ( not ( = ?auto_21337 ?auto_21335 ) ) ( not ( = ?auto_21332 ?auto_21333 ) ) ( PERSON-AT ?auto_21333 ?auto_21338 ) ( IN ?auto_21332 ?auto_21336 ) ( AIRCRAFT-AT ?auto_21336 ?auto_21334 ) ( FUEL-LEVEL ?auto_21336 ?auto_21337 ) ( not ( = ?auto_21331 ?auto_21334 ) ) ( not ( = ?auto_21338 ?auto_21334 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_21333 ?auto_21331 )
      ( FLY-2PPL-VERIFY ?auto_21332 ?auto_21333 ?auto_21331 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21340 - PERSON
      ?auto_21341 - PERSON
      ?auto_21339 - CITY
    )
    :vars
    (
      ?auto_21342 - FLEVEL
      ?auto_21345 - FLEVEL
      ?auto_21343 - CITY
      ?auto_21346 - AIRCRAFT
      ?auto_21344 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21342 ?auto_21345 ) ( not ( = ?auto_21339 ?auto_21343 ) ) ( not ( = ?auto_21345 ?auto_21342 ) ) ( not ( = ?auto_21341 ?auto_21340 ) ) ( PERSON-AT ?auto_21340 ?auto_21343 ) ( IN ?auto_21341 ?auto_21346 ) ( AIRCRAFT-AT ?auto_21346 ?auto_21344 ) ( FUEL-LEVEL ?auto_21346 ?auto_21345 ) ( not ( = ?auto_21339 ?auto_21344 ) ) ( not ( = ?auto_21343 ?auto_21344 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21341 ?auto_21340 ?auto_21339 )
      ( FLY-2PPL-VERIFY ?auto_21340 ?auto_21341 ?auto_21339 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_21421 - PERSON
      ?auto_21420 - CITY
    )
    :vars
    (
      ?auto_21423 - FLEVEL
      ?auto_21426 - FLEVEL
      ?auto_21424 - CITY
      ?auto_21422 - PERSON
      ?auto_21427 - AIRCRAFT
      ?auto_21425 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21423 ?auto_21426 ) ( not ( = ?auto_21420 ?auto_21424 ) ) ( not ( = ?auto_21426 ?auto_21423 ) ) ( not ( = ?auto_21422 ?auto_21421 ) ) ( PERSON-AT ?auto_21421 ?auto_21424 ) ( AIRCRAFT-AT ?auto_21427 ?auto_21425 ) ( FUEL-LEVEL ?auto_21427 ?auto_21426 ) ( not ( = ?auto_21420 ?auto_21425 ) ) ( not ( = ?auto_21424 ?auto_21425 ) ) ( PERSON-AT ?auto_21422 ?auto_21425 ) )
    :subtasks
    ( ( !BOARD ?auto_21422 ?auto_21427 ?auto_21425 )
      ( FLY-2PPL ?auto_21422 ?auto_21421 ?auto_21420 )
      ( FLY-1PPL-VERIFY ?auto_21421 ?auto_21420 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21429 - PERSON
      ?auto_21430 - PERSON
      ?auto_21428 - CITY
    )
    :vars
    (
      ?auto_21434 - FLEVEL
      ?auto_21435 - FLEVEL
      ?auto_21431 - CITY
      ?auto_21432 - AIRCRAFT
      ?auto_21433 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21434 ?auto_21435 ) ( not ( = ?auto_21428 ?auto_21431 ) ) ( not ( = ?auto_21435 ?auto_21434 ) ) ( not ( = ?auto_21429 ?auto_21430 ) ) ( PERSON-AT ?auto_21430 ?auto_21431 ) ( AIRCRAFT-AT ?auto_21432 ?auto_21433 ) ( FUEL-LEVEL ?auto_21432 ?auto_21435 ) ( not ( = ?auto_21428 ?auto_21433 ) ) ( not ( = ?auto_21431 ?auto_21433 ) ) ( PERSON-AT ?auto_21429 ?auto_21433 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_21430 ?auto_21428 )
      ( FLY-2PPL-VERIFY ?auto_21429 ?auto_21430 ?auto_21428 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21437 - PERSON
      ?auto_21438 - PERSON
      ?auto_21436 - CITY
    )
    :vars
    (
      ?auto_21443 - FLEVEL
      ?auto_21441 - FLEVEL
      ?auto_21439 - CITY
      ?auto_21440 - AIRCRAFT
      ?auto_21442 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21443 ?auto_21441 ) ( not ( = ?auto_21436 ?auto_21439 ) ) ( not ( = ?auto_21441 ?auto_21443 ) ) ( not ( = ?auto_21438 ?auto_21437 ) ) ( PERSON-AT ?auto_21437 ?auto_21439 ) ( AIRCRAFT-AT ?auto_21440 ?auto_21442 ) ( FUEL-LEVEL ?auto_21440 ?auto_21441 ) ( not ( = ?auto_21436 ?auto_21442 ) ) ( not ( = ?auto_21439 ?auto_21442 ) ) ( PERSON-AT ?auto_21438 ?auto_21442 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21438 ?auto_21437 ?auto_21436 )
      ( FLY-2PPL-VERIFY ?auto_21437 ?auto_21438 ?auto_21436 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_21518 - PERSON
      ?auto_21517 - CITY
    )
    :vars
    (
      ?auto_21524 - FLEVEL
      ?auto_21521 - FLEVEL
      ?auto_21519 - CITY
      ?auto_21523 - PERSON
      ?auto_21520 - AIRCRAFT
      ?auto_21522 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21524 ?auto_21521 ) ( not ( = ?auto_21517 ?auto_21519 ) ) ( not ( = ?auto_21521 ?auto_21524 ) ) ( not ( = ?auto_21523 ?auto_21518 ) ) ( PERSON-AT ?auto_21518 ?auto_21519 ) ( AIRCRAFT-AT ?auto_21520 ?auto_21522 ) ( not ( = ?auto_21517 ?auto_21522 ) ) ( not ( = ?auto_21519 ?auto_21522 ) ) ( PERSON-AT ?auto_21523 ?auto_21522 ) ( FUEL-LEVEL ?auto_21520 ?auto_21524 ) )
    :subtasks
    ( ( !REFUEL ?auto_21520 ?auto_21522 ?auto_21524 ?auto_21521 )
      ( FLY-2PPL ?auto_21523 ?auto_21518 ?auto_21517 )
      ( FLY-1PPL-VERIFY ?auto_21518 ?auto_21517 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21526 - PERSON
      ?auto_21527 - PERSON
      ?auto_21525 - CITY
    )
    :vars
    (
      ?auto_21529 - FLEVEL
      ?auto_21532 - FLEVEL
      ?auto_21531 - CITY
      ?auto_21530 - AIRCRAFT
      ?auto_21528 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21529 ?auto_21532 ) ( not ( = ?auto_21525 ?auto_21531 ) ) ( not ( = ?auto_21532 ?auto_21529 ) ) ( not ( = ?auto_21526 ?auto_21527 ) ) ( PERSON-AT ?auto_21527 ?auto_21531 ) ( AIRCRAFT-AT ?auto_21530 ?auto_21528 ) ( not ( = ?auto_21525 ?auto_21528 ) ) ( not ( = ?auto_21531 ?auto_21528 ) ) ( PERSON-AT ?auto_21526 ?auto_21528 ) ( FUEL-LEVEL ?auto_21530 ?auto_21529 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_21527 ?auto_21525 )
      ( FLY-2PPL-VERIFY ?auto_21526 ?auto_21527 ?auto_21525 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_21534 - PERSON
      ?auto_21535 - PERSON
      ?auto_21533 - CITY
    )
    :vars
    (
      ?auto_21540 - FLEVEL
      ?auto_21538 - FLEVEL
      ?auto_21536 - CITY
      ?auto_21537 - AIRCRAFT
      ?auto_21539 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_21540 ?auto_21538 ) ( not ( = ?auto_21533 ?auto_21536 ) ) ( not ( = ?auto_21538 ?auto_21540 ) ) ( not ( = ?auto_21535 ?auto_21534 ) ) ( PERSON-AT ?auto_21534 ?auto_21536 ) ( AIRCRAFT-AT ?auto_21537 ?auto_21539 ) ( not ( = ?auto_21533 ?auto_21539 ) ) ( not ( = ?auto_21536 ?auto_21539 ) ) ( PERSON-AT ?auto_21535 ?auto_21539 ) ( FUEL-LEVEL ?auto_21537 ?auto_21540 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_21535 ?auto_21534 ?auto_21533 )
      ( FLY-2PPL-VERIFY ?auto_21534 ?auto_21535 ?auto_21533 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22046 - PERSON
      ?auto_22047 - PERSON
      ?auto_22048 - PERSON
      ?auto_22045 - CITY
    )
    :vars
    (
      ?auto_22049 - AIRCRAFT
      ?auto_22053 - CITY
      ?auto_22052 - FLEVEL
      ?auto_22050 - FLEVEL
      ?auto_22051 - PERSON
    )
    :precondition
    ( and ( IN ?auto_22048 ?auto_22049 ) ( AIRCRAFT-AT ?auto_22049 ?auto_22053 ) ( FUEL-LEVEL ?auto_22049 ?auto_22052 ) ( NEXT ?auto_22050 ?auto_22052 ) ( not ( = ?auto_22045 ?auto_22053 ) ) ( not ( = ?auto_22052 ?auto_22050 ) ) ( PERSON-AT ?auto_22051 ?auto_22045 ) ( not ( = ?auto_22051 ?auto_22048 ) ) ( PERSON-AT ?auto_22046 ?auto_22045 ) ( PERSON-AT ?auto_22047 ?auto_22045 ) ( not ( = ?auto_22046 ?auto_22047 ) ) ( not ( = ?auto_22046 ?auto_22048 ) ) ( not ( = ?auto_22046 ?auto_22051 ) ) ( not ( = ?auto_22047 ?auto_22048 ) ) ( not ( = ?auto_22047 ?auto_22051 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22051 ?auto_22048 ?auto_22045 )
      ( FLY-3PPL-VERIFY ?auto_22046 ?auto_22047 ?auto_22048 ?auto_22045 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22059 - PERSON
      ?auto_22060 - PERSON
      ?auto_22061 - PERSON
      ?auto_22058 - CITY
    )
    :vars
    (
      ?auto_22062 - AIRCRAFT
      ?auto_22066 - CITY
      ?auto_22065 - FLEVEL
      ?auto_22063 - FLEVEL
      ?auto_22064 - PERSON
    )
    :precondition
    ( and ( IN ?auto_22060 ?auto_22062 ) ( AIRCRAFT-AT ?auto_22062 ?auto_22066 ) ( FUEL-LEVEL ?auto_22062 ?auto_22065 ) ( NEXT ?auto_22063 ?auto_22065 ) ( not ( = ?auto_22058 ?auto_22066 ) ) ( not ( = ?auto_22065 ?auto_22063 ) ) ( PERSON-AT ?auto_22064 ?auto_22058 ) ( not ( = ?auto_22064 ?auto_22060 ) ) ( PERSON-AT ?auto_22059 ?auto_22058 ) ( PERSON-AT ?auto_22061 ?auto_22058 ) ( not ( = ?auto_22059 ?auto_22060 ) ) ( not ( = ?auto_22059 ?auto_22061 ) ) ( not ( = ?auto_22059 ?auto_22064 ) ) ( not ( = ?auto_22060 ?auto_22061 ) ) ( not ( = ?auto_22061 ?auto_22064 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22064 ?auto_22060 ?auto_22058 )
      ( FLY-3PPL-VERIFY ?auto_22059 ?auto_22060 ?auto_22061 ?auto_22058 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22077 - PERSON
      ?auto_22078 - PERSON
      ?auto_22079 - PERSON
      ?auto_22076 - CITY
    )
    :vars
    (
      ?auto_22080 - AIRCRAFT
      ?auto_22083 - CITY
      ?auto_22082 - FLEVEL
      ?auto_22081 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_22077 ?auto_22080 ) ( AIRCRAFT-AT ?auto_22080 ?auto_22083 ) ( FUEL-LEVEL ?auto_22080 ?auto_22082 ) ( NEXT ?auto_22081 ?auto_22082 ) ( not ( = ?auto_22076 ?auto_22083 ) ) ( not ( = ?auto_22082 ?auto_22081 ) ) ( PERSON-AT ?auto_22079 ?auto_22076 ) ( not ( = ?auto_22079 ?auto_22077 ) ) ( PERSON-AT ?auto_22078 ?auto_22076 ) ( not ( = ?auto_22077 ?auto_22078 ) ) ( not ( = ?auto_22078 ?auto_22079 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22079 ?auto_22077 ?auto_22076 )
      ( FLY-3PPL-VERIFY ?auto_22077 ?auto_22078 ?auto_22079 ?auto_22076 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22101 - PERSON
      ?auto_22102 - PERSON
      ?auto_22103 - PERSON
      ?auto_22100 - CITY
    )
    :vars
    (
      ?auto_22104 - AIRCRAFT
      ?auto_22108 - CITY
      ?auto_22107 - FLEVEL
      ?auto_22105 - FLEVEL
      ?auto_22106 - PERSON
    )
    :precondition
    ( and ( IN ?auto_22101 ?auto_22104 ) ( AIRCRAFT-AT ?auto_22104 ?auto_22108 ) ( FUEL-LEVEL ?auto_22104 ?auto_22107 ) ( NEXT ?auto_22105 ?auto_22107 ) ( not ( = ?auto_22100 ?auto_22108 ) ) ( not ( = ?auto_22107 ?auto_22105 ) ) ( PERSON-AT ?auto_22106 ?auto_22100 ) ( not ( = ?auto_22106 ?auto_22101 ) ) ( PERSON-AT ?auto_22102 ?auto_22100 ) ( PERSON-AT ?auto_22103 ?auto_22100 ) ( not ( = ?auto_22101 ?auto_22102 ) ) ( not ( = ?auto_22101 ?auto_22103 ) ) ( not ( = ?auto_22102 ?auto_22103 ) ) ( not ( = ?auto_22102 ?auto_22106 ) ) ( not ( = ?auto_22103 ?auto_22106 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22106 ?auto_22101 ?auto_22100 )
      ( FLY-3PPL-VERIFY ?auto_22101 ?auto_22102 ?auto_22103 ?auto_22100 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22180 - PERSON
      ?auto_22181 - PERSON
      ?auto_22182 - PERSON
      ?auto_22179 - CITY
    )
    :vars
    (
      ?auto_22186 - AIRCRAFT
      ?auto_22185 - CITY
      ?auto_22184 - FLEVEL
      ?auto_22183 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_22186 ?auto_22185 ) ( FUEL-LEVEL ?auto_22186 ?auto_22184 ) ( NEXT ?auto_22183 ?auto_22184 ) ( not ( = ?auto_22179 ?auto_22185 ) ) ( not ( = ?auto_22184 ?auto_22183 ) ) ( PERSON-AT ?auto_22181 ?auto_22179 ) ( not ( = ?auto_22181 ?auto_22182 ) ) ( PERSON-AT ?auto_22182 ?auto_22185 ) ( PERSON-AT ?auto_22180 ?auto_22179 ) ( not ( = ?auto_22180 ?auto_22181 ) ) ( not ( = ?auto_22180 ?auto_22182 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22181 ?auto_22182 ?auto_22179 )
      ( FLY-3PPL-VERIFY ?auto_22180 ?auto_22181 ?auto_22182 ?auto_22179 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22192 - PERSON
      ?auto_22193 - PERSON
      ?auto_22194 - PERSON
      ?auto_22191 - CITY
    )
    :vars
    (
      ?auto_22198 - AIRCRAFT
      ?auto_22197 - CITY
      ?auto_22196 - FLEVEL
      ?auto_22195 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_22198 ?auto_22197 ) ( FUEL-LEVEL ?auto_22198 ?auto_22196 ) ( NEXT ?auto_22195 ?auto_22196 ) ( not ( = ?auto_22191 ?auto_22197 ) ) ( not ( = ?auto_22196 ?auto_22195 ) ) ( PERSON-AT ?auto_22192 ?auto_22191 ) ( not ( = ?auto_22192 ?auto_22193 ) ) ( PERSON-AT ?auto_22193 ?auto_22197 ) ( PERSON-AT ?auto_22194 ?auto_22191 ) ( not ( = ?auto_22192 ?auto_22194 ) ) ( not ( = ?auto_22193 ?auto_22194 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22192 ?auto_22193 ?auto_22191 )
      ( FLY-3PPL-VERIFY ?auto_22192 ?auto_22193 ?auto_22194 ?auto_22191 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22216 - PERSON
      ?auto_22217 - PERSON
      ?auto_22218 - PERSON
      ?auto_22215 - CITY
    )
    :vars
    (
      ?auto_22223 - AIRCRAFT
      ?auto_22222 - CITY
      ?auto_22221 - FLEVEL
      ?auto_22220 - FLEVEL
      ?auto_22219 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_22223 ?auto_22222 ) ( FUEL-LEVEL ?auto_22223 ?auto_22221 ) ( NEXT ?auto_22220 ?auto_22221 ) ( not ( = ?auto_22215 ?auto_22222 ) ) ( not ( = ?auto_22221 ?auto_22220 ) ) ( PERSON-AT ?auto_22219 ?auto_22215 ) ( not ( = ?auto_22219 ?auto_22218 ) ) ( PERSON-AT ?auto_22218 ?auto_22222 ) ( PERSON-AT ?auto_22216 ?auto_22215 ) ( PERSON-AT ?auto_22217 ?auto_22215 ) ( not ( = ?auto_22216 ?auto_22217 ) ) ( not ( = ?auto_22216 ?auto_22218 ) ) ( not ( = ?auto_22216 ?auto_22219 ) ) ( not ( = ?auto_22217 ?auto_22218 ) ) ( not ( = ?auto_22217 ?auto_22219 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22219 ?auto_22218 ?auto_22215 )
      ( FLY-3PPL-VERIFY ?auto_22216 ?auto_22217 ?auto_22218 ?auto_22215 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22229 - PERSON
      ?auto_22230 - PERSON
      ?auto_22231 - PERSON
      ?auto_22228 - CITY
    )
    :vars
    (
      ?auto_22236 - AIRCRAFT
      ?auto_22235 - CITY
      ?auto_22234 - FLEVEL
      ?auto_22233 - FLEVEL
      ?auto_22232 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_22236 ?auto_22235 ) ( FUEL-LEVEL ?auto_22236 ?auto_22234 ) ( NEXT ?auto_22233 ?auto_22234 ) ( not ( = ?auto_22228 ?auto_22235 ) ) ( not ( = ?auto_22234 ?auto_22233 ) ) ( PERSON-AT ?auto_22232 ?auto_22228 ) ( not ( = ?auto_22232 ?auto_22230 ) ) ( PERSON-AT ?auto_22230 ?auto_22235 ) ( PERSON-AT ?auto_22229 ?auto_22228 ) ( PERSON-AT ?auto_22231 ?auto_22228 ) ( not ( = ?auto_22229 ?auto_22230 ) ) ( not ( = ?auto_22229 ?auto_22231 ) ) ( not ( = ?auto_22229 ?auto_22232 ) ) ( not ( = ?auto_22230 ?auto_22231 ) ) ( not ( = ?auto_22231 ?auto_22232 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22232 ?auto_22230 ?auto_22228 )
      ( FLY-3PPL-VERIFY ?auto_22229 ?auto_22230 ?auto_22231 ?auto_22228 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22271 - PERSON
      ?auto_22272 - PERSON
      ?auto_22273 - PERSON
      ?auto_22270 - CITY
    )
    :vars
    (
      ?auto_22278 - AIRCRAFT
      ?auto_22277 - CITY
      ?auto_22276 - FLEVEL
      ?auto_22275 - FLEVEL
      ?auto_22274 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_22278 ?auto_22277 ) ( FUEL-LEVEL ?auto_22278 ?auto_22276 ) ( NEXT ?auto_22275 ?auto_22276 ) ( not ( = ?auto_22270 ?auto_22277 ) ) ( not ( = ?auto_22276 ?auto_22275 ) ) ( PERSON-AT ?auto_22274 ?auto_22270 ) ( not ( = ?auto_22274 ?auto_22271 ) ) ( PERSON-AT ?auto_22271 ?auto_22277 ) ( PERSON-AT ?auto_22272 ?auto_22270 ) ( PERSON-AT ?auto_22273 ?auto_22270 ) ( not ( = ?auto_22271 ?auto_22272 ) ) ( not ( = ?auto_22271 ?auto_22273 ) ) ( not ( = ?auto_22272 ?auto_22273 ) ) ( not ( = ?auto_22272 ?auto_22274 ) ) ( not ( = ?auto_22273 ?auto_22274 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22274 ?auto_22271 ?auto_22270 )
      ( FLY-3PPL-VERIFY ?auto_22271 ?auto_22272 ?auto_22273 ?auto_22270 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22350 - PERSON
      ?auto_22351 - PERSON
      ?auto_22352 - PERSON
      ?auto_22349 - CITY
    )
    :vars
    (
      ?auto_22355 - AIRCRAFT
      ?auto_22354 - CITY
      ?auto_22356 - FLEVEL
      ?auto_22353 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_22355 ?auto_22354 ) ( NEXT ?auto_22356 ?auto_22353 ) ( not ( = ?auto_22349 ?auto_22354 ) ) ( not ( = ?auto_22353 ?auto_22356 ) ) ( PERSON-AT ?auto_22351 ?auto_22349 ) ( not ( = ?auto_22351 ?auto_22352 ) ) ( PERSON-AT ?auto_22352 ?auto_22354 ) ( FUEL-LEVEL ?auto_22355 ?auto_22356 ) ( PERSON-AT ?auto_22350 ?auto_22349 ) ( not ( = ?auto_22350 ?auto_22351 ) ) ( not ( = ?auto_22350 ?auto_22352 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22351 ?auto_22352 ?auto_22349 )
      ( FLY-3PPL-VERIFY ?auto_22350 ?auto_22351 ?auto_22352 ?auto_22349 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22386 - PERSON
      ?auto_22387 - PERSON
      ?auto_22388 - PERSON
      ?auto_22385 - CITY
    )
    :vars
    (
      ?auto_22391 - AIRCRAFT
      ?auto_22390 - CITY
      ?auto_22393 - FLEVEL
      ?auto_22389 - FLEVEL
      ?auto_22392 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_22391 ?auto_22390 ) ( NEXT ?auto_22393 ?auto_22389 ) ( not ( = ?auto_22385 ?auto_22390 ) ) ( not ( = ?auto_22389 ?auto_22393 ) ) ( PERSON-AT ?auto_22392 ?auto_22385 ) ( not ( = ?auto_22392 ?auto_22388 ) ) ( PERSON-AT ?auto_22388 ?auto_22390 ) ( FUEL-LEVEL ?auto_22391 ?auto_22393 ) ( PERSON-AT ?auto_22386 ?auto_22385 ) ( PERSON-AT ?auto_22387 ?auto_22385 ) ( not ( = ?auto_22386 ?auto_22387 ) ) ( not ( = ?auto_22386 ?auto_22388 ) ) ( not ( = ?auto_22386 ?auto_22392 ) ) ( not ( = ?auto_22387 ?auto_22388 ) ) ( not ( = ?auto_22387 ?auto_22392 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22392 ?auto_22388 ?auto_22385 )
      ( FLY-3PPL-VERIFY ?auto_22386 ?auto_22387 ?auto_22388 ?auto_22385 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22399 - PERSON
      ?auto_22400 - PERSON
      ?auto_22401 - PERSON
      ?auto_22398 - CITY
    )
    :vars
    (
      ?auto_22404 - AIRCRAFT
      ?auto_22403 - CITY
      ?auto_22406 - FLEVEL
      ?auto_22402 - FLEVEL
      ?auto_22405 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_22404 ?auto_22403 ) ( NEXT ?auto_22406 ?auto_22402 ) ( not ( = ?auto_22398 ?auto_22403 ) ) ( not ( = ?auto_22402 ?auto_22406 ) ) ( PERSON-AT ?auto_22405 ?auto_22398 ) ( not ( = ?auto_22405 ?auto_22400 ) ) ( PERSON-AT ?auto_22400 ?auto_22403 ) ( FUEL-LEVEL ?auto_22404 ?auto_22406 ) ( PERSON-AT ?auto_22399 ?auto_22398 ) ( PERSON-AT ?auto_22401 ?auto_22398 ) ( not ( = ?auto_22399 ?auto_22400 ) ) ( not ( = ?auto_22399 ?auto_22401 ) ) ( not ( = ?auto_22399 ?auto_22405 ) ) ( not ( = ?auto_22400 ?auto_22401 ) ) ( not ( = ?auto_22401 ?auto_22405 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22405 ?auto_22400 ?auto_22398 )
      ( FLY-3PPL-VERIFY ?auto_22399 ?auto_22400 ?auto_22401 ?auto_22398 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22417 - PERSON
      ?auto_22418 - PERSON
      ?auto_22419 - PERSON
      ?auto_22416 - CITY
    )
    :vars
    (
      ?auto_22422 - AIRCRAFT
      ?auto_22421 - CITY
      ?auto_22423 - FLEVEL
      ?auto_22420 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_22422 ?auto_22421 ) ( NEXT ?auto_22423 ?auto_22420 ) ( not ( = ?auto_22416 ?auto_22421 ) ) ( not ( = ?auto_22420 ?auto_22423 ) ) ( PERSON-AT ?auto_22419 ?auto_22416 ) ( not ( = ?auto_22419 ?auto_22417 ) ) ( PERSON-AT ?auto_22417 ?auto_22421 ) ( FUEL-LEVEL ?auto_22422 ?auto_22423 ) ( PERSON-AT ?auto_22418 ?auto_22416 ) ( not ( = ?auto_22417 ?auto_22418 ) ) ( not ( = ?auto_22418 ?auto_22419 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22419 ?auto_22417 ?auto_22416 )
      ( FLY-3PPL-VERIFY ?auto_22417 ?auto_22418 ?auto_22419 ?auto_22416 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22441 - PERSON
      ?auto_22442 - PERSON
      ?auto_22443 - PERSON
      ?auto_22440 - CITY
    )
    :vars
    (
      ?auto_22446 - AIRCRAFT
      ?auto_22445 - CITY
      ?auto_22448 - FLEVEL
      ?auto_22444 - FLEVEL
      ?auto_22447 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_22446 ?auto_22445 ) ( NEXT ?auto_22448 ?auto_22444 ) ( not ( = ?auto_22440 ?auto_22445 ) ) ( not ( = ?auto_22444 ?auto_22448 ) ) ( PERSON-AT ?auto_22447 ?auto_22440 ) ( not ( = ?auto_22447 ?auto_22441 ) ) ( PERSON-AT ?auto_22441 ?auto_22445 ) ( FUEL-LEVEL ?auto_22446 ?auto_22448 ) ( PERSON-AT ?auto_22442 ?auto_22440 ) ( PERSON-AT ?auto_22443 ?auto_22440 ) ( not ( = ?auto_22441 ?auto_22442 ) ) ( not ( = ?auto_22441 ?auto_22443 ) ) ( not ( = ?auto_22442 ?auto_22443 ) ) ( not ( = ?auto_22442 ?auto_22447 ) ) ( not ( = ?auto_22443 ?auto_22447 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22447 ?auto_22441 ?auto_22440 )
      ( FLY-3PPL-VERIFY ?auto_22441 ?auto_22442 ?auto_22443 ?auto_22440 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22520 - PERSON
      ?auto_22521 - PERSON
      ?auto_22522 - PERSON
      ?auto_22519 - CITY
    )
    :vars
    (
      ?auto_22525 - FLEVEL
      ?auto_22526 - FLEVEL
      ?auto_22523 - CITY
      ?auto_22524 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22525 ?auto_22526 ) ( not ( = ?auto_22519 ?auto_22523 ) ) ( not ( = ?auto_22526 ?auto_22525 ) ) ( PERSON-AT ?auto_22521 ?auto_22519 ) ( not ( = ?auto_22521 ?auto_22522 ) ) ( PERSON-AT ?auto_22522 ?auto_22523 ) ( AIRCRAFT-AT ?auto_22524 ?auto_22519 ) ( FUEL-LEVEL ?auto_22524 ?auto_22526 ) ( PERSON-AT ?auto_22520 ?auto_22519 ) ( not ( = ?auto_22520 ?auto_22521 ) ) ( not ( = ?auto_22520 ?auto_22522 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22521 ?auto_22522 ?auto_22519 )
      ( FLY-3PPL-VERIFY ?auto_22520 ?auto_22521 ?auto_22522 ?auto_22519 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22556 - PERSON
      ?auto_22557 - PERSON
      ?auto_22558 - PERSON
      ?auto_22555 - CITY
    )
    :vars
    (
      ?auto_22561 - FLEVEL
      ?auto_22563 - FLEVEL
      ?auto_22559 - CITY
      ?auto_22562 - PERSON
      ?auto_22560 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22561 ?auto_22563 ) ( not ( = ?auto_22555 ?auto_22559 ) ) ( not ( = ?auto_22563 ?auto_22561 ) ) ( PERSON-AT ?auto_22562 ?auto_22555 ) ( not ( = ?auto_22562 ?auto_22558 ) ) ( PERSON-AT ?auto_22558 ?auto_22559 ) ( AIRCRAFT-AT ?auto_22560 ?auto_22555 ) ( FUEL-LEVEL ?auto_22560 ?auto_22563 ) ( PERSON-AT ?auto_22556 ?auto_22555 ) ( PERSON-AT ?auto_22557 ?auto_22555 ) ( not ( = ?auto_22556 ?auto_22557 ) ) ( not ( = ?auto_22556 ?auto_22558 ) ) ( not ( = ?auto_22556 ?auto_22562 ) ) ( not ( = ?auto_22557 ?auto_22558 ) ) ( not ( = ?auto_22557 ?auto_22562 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22562 ?auto_22558 ?auto_22555 )
      ( FLY-3PPL-VERIFY ?auto_22556 ?auto_22557 ?auto_22558 ?auto_22555 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22569 - PERSON
      ?auto_22570 - PERSON
      ?auto_22571 - PERSON
      ?auto_22568 - CITY
    )
    :vars
    (
      ?auto_22574 - FLEVEL
      ?auto_22576 - FLEVEL
      ?auto_22572 - CITY
      ?auto_22575 - PERSON
      ?auto_22573 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22574 ?auto_22576 ) ( not ( = ?auto_22568 ?auto_22572 ) ) ( not ( = ?auto_22576 ?auto_22574 ) ) ( PERSON-AT ?auto_22575 ?auto_22568 ) ( not ( = ?auto_22575 ?auto_22570 ) ) ( PERSON-AT ?auto_22570 ?auto_22572 ) ( AIRCRAFT-AT ?auto_22573 ?auto_22568 ) ( FUEL-LEVEL ?auto_22573 ?auto_22576 ) ( PERSON-AT ?auto_22569 ?auto_22568 ) ( PERSON-AT ?auto_22571 ?auto_22568 ) ( not ( = ?auto_22569 ?auto_22570 ) ) ( not ( = ?auto_22569 ?auto_22571 ) ) ( not ( = ?auto_22569 ?auto_22575 ) ) ( not ( = ?auto_22570 ?auto_22571 ) ) ( not ( = ?auto_22571 ?auto_22575 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22575 ?auto_22570 ?auto_22568 )
      ( FLY-3PPL-VERIFY ?auto_22569 ?auto_22570 ?auto_22571 ?auto_22568 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22611 - PERSON
      ?auto_22612 - PERSON
      ?auto_22613 - PERSON
      ?auto_22610 - CITY
    )
    :vars
    (
      ?auto_22616 - FLEVEL
      ?auto_22618 - FLEVEL
      ?auto_22614 - CITY
      ?auto_22617 - PERSON
      ?auto_22615 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22616 ?auto_22618 ) ( not ( = ?auto_22610 ?auto_22614 ) ) ( not ( = ?auto_22618 ?auto_22616 ) ) ( PERSON-AT ?auto_22617 ?auto_22610 ) ( not ( = ?auto_22617 ?auto_22611 ) ) ( PERSON-AT ?auto_22611 ?auto_22614 ) ( AIRCRAFT-AT ?auto_22615 ?auto_22610 ) ( FUEL-LEVEL ?auto_22615 ?auto_22618 ) ( PERSON-AT ?auto_22612 ?auto_22610 ) ( PERSON-AT ?auto_22613 ?auto_22610 ) ( not ( = ?auto_22611 ?auto_22612 ) ) ( not ( = ?auto_22611 ?auto_22613 ) ) ( not ( = ?auto_22612 ?auto_22613 ) ) ( not ( = ?auto_22612 ?auto_22617 ) ) ( not ( = ?auto_22613 ?auto_22617 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22617 ?auto_22611 ?auto_22610 )
      ( FLY-3PPL-VERIFY ?auto_22611 ?auto_22612 ?auto_22613 ?auto_22610 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22690 - PERSON
      ?auto_22691 - PERSON
      ?auto_22692 - PERSON
      ?auto_22689 - CITY
    )
    :vars
    (
      ?auto_22696 - FLEVEL
      ?auto_22694 - FLEVEL
      ?auto_22695 - CITY
      ?auto_22693 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22696 ?auto_22694 ) ( not ( = ?auto_22689 ?auto_22695 ) ) ( not ( = ?auto_22694 ?auto_22696 ) ) ( PERSON-AT ?auto_22691 ?auto_22689 ) ( not ( = ?auto_22691 ?auto_22692 ) ) ( PERSON-AT ?auto_22692 ?auto_22695 ) ( AIRCRAFT-AT ?auto_22693 ?auto_22689 ) ( FUEL-LEVEL ?auto_22693 ?auto_22696 ) ( PERSON-AT ?auto_22690 ?auto_22689 ) ( not ( = ?auto_22690 ?auto_22691 ) ) ( not ( = ?auto_22690 ?auto_22692 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22691 ?auto_22692 ?auto_22689 )
      ( FLY-3PPL-VERIFY ?auto_22690 ?auto_22691 ?auto_22692 ?auto_22689 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22702 - PERSON
      ?auto_22703 - PERSON
      ?auto_22704 - PERSON
      ?auto_22701 - CITY
    )
    :vars
    (
      ?auto_22708 - FLEVEL
      ?auto_22706 - FLEVEL
      ?auto_22707 - CITY
      ?auto_22705 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22708 ?auto_22706 ) ( not ( = ?auto_22701 ?auto_22707 ) ) ( not ( = ?auto_22706 ?auto_22708 ) ) ( PERSON-AT ?auto_22702 ?auto_22701 ) ( not ( = ?auto_22702 ?auto_22703 ) ) ( PERSON-AT ?auto_22703 ?auto_22707 ) ( AIRCRAFT-AT ?auto_22705 ?auto_22701 ) ( FUEL-LEVEL ?auto_22705 ?auto_22708 ) ( PERSON-AT ?auto_22704 ?auto_22701 ) ( not ( = ?auto_22702 ?auto_22704 ) ) ( not ( = ?auto_22703 ?auto_22704 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22702 ?auto_22703 ?auto_22701 )
      ( FLY-3PPL-VERIFY ?auto_22702 ?auto_22703 ?auto_22704 ?auto_22701 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22726 - PERSON
      ?auto_22727 - PERSON
      ?auto_22728 - PERSON
      ?auto_22725 - CITY
    )
    :vars
    (
      ?auto_22733 - FLEVEL
      ?auto_22730 - FLEVEL
      ?auto_22731 - CITY
      ?auto_22732 - PERSON
      ?auto_22729 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22733 ?auto_22730 ) ( not ( = ?auto_22725 ?auto_22731 ) ) ( not ( = ?auto_22730 ?auto_22733 ) ) ( PERSON-AT ?auto_22732 ?auto_22725 ) ( not ( = ?auto_22732 ?auto_22728 ) ) ( PERSON-AT ?auto_22728 ?auto_22731 ) ( AIRCRAFT-AT ?auto_22729 ?auto_22725 ) ( FUEL-LEVEL ?auto_22729 ?auto_22733 ) ( PERSON-AT ?auto_22726 ?auto_22725 ) ( PERSON-AT ?auto_22727 ?auto_22725 ) ( not ( = ?auto_22726 ?auto_22727 ) ) ( not ( = ?auto_22726 ?auto_22728 ) ) ( not ( = ?auto_22726 ?auto_22732 ) ) ( not ( = ?auto_22727 ?auto_22728 ) ) ( not ( = ?auto_22727 ?auto_22732 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22732 ?auto_22728 ?auto_22725 )
      ( FLY-3PPL-VERIFY ?auto_22726 ?auto_22727 ?auto_22728 ?auto_22725 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22739 - PERSON
      ?auto_22740 - PERSON
      ?auto_22741 - PERSON
      ?auto_22738 - CITY
    )
    :vars
    (
      ?auto_22746 - FLEVEL
      ?auto_22743 - FLEVEL
      ?auto_22744 - CITY
      ?auto_22745 - PERSON
      ?auto_22742 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22746 ?auto_22743 ) ( not ( = ?auto_22738 ?auto_22744 ) ) ( not ( = ?auto_22743 ?auto_22746 ) ) ( PERSON-AT ?auto_22745 ?auto_22738 ) ( not ( = ?auto_22745 ?auto_22740 ) ) ( PERSON-AT ?auto_22740 ?auto_22744 ) ( AIRCRAFT-AT ?auto_22742 ?auto_22738 ) ( FUEL-LEVEL ?auto_22742 ?auto_22746 ) ( PERSON-AT ?auto_22739 ?auto_22738 ) ( PERSON-AT ?auto_22741 ?auto_22738 ) ( not ( = ?auto_22739 ?auto_22740 ) ) ( not ( = ?auto_22739 ?auto_22741 ) ) ( not ( = ?auto_22739 ?auto_22745 ) ) ( not ( = ?auto_22740 ?auto_22741 ) ) ( not ( = ?auto_22741 ?auto_22745 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22745 ?auto_22740 ?auto_22738 )
      ( FLY-3PPL-VERIFY ?auto_22739 ?auto_22740 ?auto_22741 ?auto_22738 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22757 - PERSON
      ?auto_22758 - PERSON
      ?auto_22759 - PERSON
      ?auto_22756 - CITY
    )
    :vars
    (
      ?auto_22763 - FLEVEL
      ?auto_22761 - FLEVEL
      ?auto_22762 - CITY
      ?auto_22760 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22763 ?auto_22761 ) ( not ( = ?auto_22756 ?auto_22762 ) ) ( not ( = ?auto_22761 ?auto_22763 ) ) ( PERSON-AT ?auto_22758 ?auto_22756 ) ( not ( = ?auto_22758 ?auto_22757 ) ) ( PERSON-AT ?auto_22757 ?auto_22762 ) ( AIRCRAFT-AT ?auto_22760 ?auto_22756 ) ( FUEL-LEVEL ?auto_22760 ?auto_22763 ) ( PERSON-AT ?auto_22759 ?auto_22756 ) ( not ( = ?auto_22757 ?auto_22759 ) ) ( not ( = ?auto_22758 ?auto_22759 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22758 ?auto_22757 ?auto_22756 )
      ( FLY-3PPL-VERIFY ?auto_22757 ?auto_22758 ?auto_22759 ?auto_22756 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_22781 - PERSON
      ?auto_22782 - PERSON
      ?auto_22783 - PERSON
      ?auto_22780 - CITY
    )
    :vars
    (
      ?auto_22788 - FLEVEL
      ?auto_22785 - FLEVEL
      ?auto_22786 - CITY
      ?auto_22787 - PERSON
      ?auto_22784 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_22788 ?auto_22785 ) ( not ( = ?auto_22780 ?auto_22786 ) ) ( not ( = ?auto_22785 ?auto_22788 ) ) ( PERSON-AT ?auto_22787 ?auto_22780 ) ( not ( = ?auto_22787 ?auto_22781 ) ) ( PERSON-AT ?auto_22781 ?auto_22786 ) ( AIRCRAFT-AT ?auto_22784 ?auto_22780 ) ( FUEL-LEVEL ?auto_22784 ?auto_22788 ) ( PERSON-AT ?auto_22782 ?auto_22780 ) ( PERSON-AT ?auto_22783 ?auto_22780 ) ( not ( = ?auto_22781 ?auto_22782 ) ) ( not ( = ?auto_22781 ?auto_22783 ) ) ( not ( = ?auto_22782 ?auto_22783 ) ) ( not ( = ?auto_22782 ?auto_22787 ) ) ( not ( = ?auto_22783 ?auto_22787 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_22787 ?auto_22781 ?auto_22780 )
      ( FLY-3PPL-VERIFY ?auto_22781 ?auto_22782 ?auto_22783 ?auto_22780 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23016 - PERSON
      ?auto_23015 - CITY
    )
    :vars
    (
      ?auto_23017 - FLEVEL
      ?auto_23021 - FLEVEL
      ?auto_23018 - CITY
      ?auto_23020 - PERSON
      ?auto_23019 - AIRCRAFT
      ?auto_23022 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23017 ?auto_23021 ) ( not ( = ?auto_23015 ?auto_23018 ) ) ( not ( = ?auto_23021 ?auto_23017 ) ) ( PERSON-AT ?auto_23020 ?auto_23015 ) ( not ( = ?auto_23020 ?auto_23016 ) ) ( PERSON-AT ?auto_23016 ?auto_23018 ) ( AIRCRAFT-AT ?auto_23019 ?auto_23022 ) ( FUEL-LEVEL ?auto_23019 ?auto_23021 ) ( not ( = ?auto_23015 ?auto_23022 ) ) ( not ( = ?auto_23018 ?auto_23022 ) ) )
    :subtasks
    ( ( !FLY ?auto_23019 ?auto_23022 ?auto_23015 ?auto_23021 ?auto_23017 )
      ( FLY-2PPL ?auto_23020 ?auto_23016 ?auto_23015 )
      ( FLY-1PPL-VERIFY ?auto_23016 ?auto_23015 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23024 - PERSON
      ?auto_23025 - PERSON
      ?auto_23023 - CITY
    )
    :vars
    (
      ?auto_23028 - FLEVEL
      ?auto_23029 - FLEVEL
      ?auto_23030 - CITY
      ?auto_23027 - AIRCRAFT
      ?auto_23026 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23028 ?auto_23029 ) ( not ( = ?auto_23023 ?auto_23030 ) ) ( not ( = ?auto_23029 ?auto_23028 ) ) ( PERSON-AT ?auto_23024 ?auto_23023 ) ( not ( = ?auto_23024 ?auto_23025 ) ) ( PERSON-AT ?auto_23025 ?auto_23030 ) ( AIRCRAFT-AT ?auto_23027 ?auto_23026 ) ( FUEL-LEVEL ?auto_23027 ?auto_23029 ) ( not ( = ?auto_23023 ?auto_23026 ) ) ( not ( = ?auto_23030 ?auto_23026 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23025 ?auto_23023 )
      ( FLY-2PPL-VERIFY ?auto_23024 ?auto_23025 ?auto_23023 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23041 - PERSON
      ?auto_23042 - PERSON
      ?auto_23040 - CITY
    )
    :vars
    (
      ?auto_23045 - FLEVEL
      ?auto_23047 - FLEVEL
      ?auto_23044 - CITY
      ?auto_23046 - AIRCRAFT
      ?auto_23043 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23045 ?auto_23047 ) ( not ( = ?auto_23040 ?auto_23044 ) ) ( not ( = ?auto_23047 ?auto_23045 ) ) ( PERSON-AT ?auto_23042 ?auto_23040 ) ( not ( = ?auto_23042 ?auto_23041 ) ) ( PERSON-AT ?auto_23041 ?auto_23044 ) ( AIRCRAFT-AT ?auto_23046 ?auto_23043 ) ( FUEL-LEVEL ?auto_23046 ?auto_23047 ) ( not ( = ?auto_23040 ?auto_23043 ) ) ( not ( = ?auto_23044 ?auto_23043 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23042 ?auto_23041 ?auto_23040 )
      ( FLY-2PPL-VERIFY ?auto_23041 ?auto_23042 ?auto_23040 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23067 - PERSON
      ?auto_23068 - PERSON
      ?auto_23069 - PERSON
      ?auto_23066 - CITY
    )
    :vars
    (
      ?auto_23072 - FLEVEL
      ?auto_23074 - FLEVEL
      ?auto_23071 - CITY
      ?auto_23073 - AIRCRAFT
      ?auto_23070 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23072 ?auto_23074 ) ( not ( = ?auto_23066 ?auto_23071 ) ) ( not ( = ?auto_23074 ?auto_23072 ) ) ( PERSON-AT ?auto_23068 ?auto_23066 ) ( not ( = ?auto_23068 ?auto_23069 ) ) ( PERSON-AT ?auto_23069 ?auto_23071 ) ( AIRCRAFT-AT ?auto_23073 ?auto_23070 ) ( FUEL-LEVEL ?auto_23073 ?auto_23074 ) ( not ( = ?auto_23066 ?auto_23070 ) ) ( not ( = ?auto_23071 ?auto_23070 ) ) ( PERSON-AT ?auto_23067 ?auto_23066 ) ( not ( = ?auto_23067 ?auto_23068 ) ) ( not ( = ?auto_23067 ?auto_23069 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23068 ?auto_23069 ?auto_23066 )
      ( FLY-3PPL-VERIFY ?auto_23067 ?auto_23068 ?auto_23069 ?auto_23066 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23085 - PERSON
      ?auto_23086 - PERSON
      ?auto_23087 - PERSON
      ?auto_23084 - CITY
    )
    :vars
    (
      ?auto_23090 - FLEVEL
      ?auto_23092 - FLEVEL
      ?auto_23089 - CITY
      ?auto_23091 - AIRCRAFT
      ?auto_23088 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23090 ?auto_23092 ) ( not ( = ?auto_23084 ?auto_23089 ) ) ( not ( = ?auto_23092 ?auto_23090 ) ) ( PERSON-AT ?auto_23085 ?auto_23084 ) ( not ( = ?auto_23085 ?auto_23086 ) ) ( PERSON-AT ?auto_23086 ?auto_23089 ) ( AIRCRAFT-AT ?auto_23091 ?auto_23088 ) ( FUEL-LEVEL ?auto_23091 ?auto_23092 ) ( not ( = ?auto_23084 ?auto_23088 ) ) ( not ( = ?auto_23089 ?auto_23088 ) ) ( PERSON-AT ?auto_23087 ?auto_23084 ) ( not ( = ?auto_23085 ?auto_23087 ) ) ( not ( = ?auto_23086 ?auto_23087 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23085 ?auto_23086 ?auto_23084 )
      ( FLY-3PPL-VERIFY ?auto_23085 ?auto_23086 ?auto_23087 ?auto_23084 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23160 - PERSON
      ?auto_23161 - PERSON
      ?auto_23162 - PERSON
      ?auto_23159 - CITY
    )
    :vars
    (
      ?auto_23165 - FLEVEL
      ?auto_23167 - FLEVEL
      ?auto_23164 - CITY
      ?auto_23166 - AIRCRAFT
      ?auto_23163 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23165 ?auto_23167 ) ( not ( = ?auto_23159 ?auto_23164 ) ) ( not ( = ?auto_23167 ?auto_23165 ) ) ( PERSON-AT ?auto_23162 ?auto_23159 ) ( not ( = ?auto_23162 ?auto_23160 ) ) ( PERSON-AT ?auto_23160 ?auto_23164 ) ( AIRCRAFT-AT ?auto_23166 ?auto_23163 ) ( FUEL-LEVEL ?auto_23166 ?auto_23167 ) ( not ( = ?auto_23159 ?auto_23163 ) ) ( not ( = ?auto_23164 ?auto_23163 ) ) ( PERSON-AT ?auto_23161 ?auto_23159 ) ( not ( = ?auto_23160 ?auto_23161 ) ) ( not ( = ?auto_23161 ?auto_23162 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23162 ?auto_23160 ?auto_23159 )
      ( FLY-3PPL-VERIFY ?auto_23160 ?auto_23161 ?auto_23162 ?auto_23159 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23280 - PERSON
      ?auto_23281 - PERSON
      ?auto_23282 - PERSON
      ?auto_23279 - CITY
    )
    :vars
    (
      ?auto_23287 - FLEVEL
      ?auto_23283 - FLEVEL
      ?auto_23286 - CITY
      ?auto_23285 - AIRCRAFT
      ?auto_23284 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23287 ?auto_23283 ) ( not ( = ?auto_23279 ?auto_23286 ) ) ( not ( = ?auto_23283 ?auto_23287 ) ) ( PERSON-AT ?auto_23280 ?auto_23279 ) ( not ( = ?auto_23280 ?auto_23282 ) ) ( PERSON-AT ?auto_23282 ?auto_23286 ) ( AIRCRAFT-AT ?auto_23285 ?auto_23284 ) ( FUEL-LEVEL ?auto_23285 ?auto_23283 ) ( not ( = ?auto_23279 ?auto_23284 ) ) ( not ( = ?auto_23286 ?auto_23284 ) ) ( PERSON-AT ?auto_23281 ?auto_23279 ) ( not ( = ?auto_23280 ?auto_23281 ) ) ( not ( = ?auto_23281 ?auto_23282 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23280 ?auto_23282 ?auto_23279 )
      ( FLY-3PPL-VERIFY ?auto_23280 ?auto_23281 ?auto_23282 ?auto_23279 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23298 - PERSON
      ?auto_23299 - PERSON
      ?auto_23300 - PERSON
      ?auto_23297 - CITY
    )
    :vars
    (
      ?auto_23305 - FLEVEL
      ?auto_23301 - FLEVEL
      ?auto_23304 - CITY
      ?auto_23303 - AIRCRAFT
      ?auto_23302 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23305 ?auto_23301 ) ( not ( = ?auto_23297 ?auto_23304 ) ) ( not ( = ?auto_23301 ?auto_23305 ) ) ( PERSON-AT ?auto_23300 ?auto_23297 ) ( not ( = ?auto_23300 ?auto_23299 ) ) ( PERSON-AT ?auto_23299 ?auto_23304 ) ( AIRCRAFT-AT ?auto_23303 ?auto_23302 ) ( FUEL-LEVEL ?auto_23303 ?auto_23301 ) ( not ( = ?auto_23297 ?auto_23302 ) ) ( not ( = ?auto_23304 ?auto_23302 ) ) ( PERSON-AT ?auto_23298 ?auto_23297 ) ( not ( = ?auto_23298 ?auto_23299 ) ) ( not ( = ?auto_23298 ?auto_23300 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23300 ?auto_23299 ?auto_23297 )
      ( FLY-3PPL-VERIFY ?auto_23298 ?auto_23299 ?auto_23300 ?auto_23297 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_23458 - PERSON
      ?auto_23457 - CITY
    )
    :vars
    (
      ?auto_23464 - FLEVEL
      ?auto_23459 - FLEVEL
      ?auto_23463 - CITY
      ?auto_23460 - PERSON
      ?auto_23462 - AIRCRAFT
      ?auto_23461 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23464 ?auto_23459 ) ( not ( = ?auto_23457 ?auto_23463 ) ) ( not ( = ?auto_23459 ?auto_23464 ) ) ( PERSON-AT ?auto_23460 ?auto_23457 ) ( not ( = ?auto_23460 ?auto_23458 ) ) ( PERSON-AT ?auto_23458 ?auto_23463 ) ( AIRCRAFT-AT ?auto_23462 ?auto_23461 ) ( not ( = ?auto_23457 ?auto_23461 ) ) ( not ( = ?auto_23463 ?auto_23461 ) ) ( FUEL-LEVEL ?auto_23462 ?auto_23464 ) )
    :subtasks
    ( ( !REFUEL ?auto_23462 ?auto_23461 ?auto_23464 ?auto_23459 )
      ( FLY-2PPL ?auto_23460 ?auto_23458 ?auto_23457 )
      ( FLY-1PPL-VERIFY ?auto_23458 ?auto_23457 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23466 - PERSON
      ?auto_23467 - PERSON
      ?auto_23465 - CITY
    )
    :vars
    (
      ?auto_23468 - FLEVEL
      ?auto_23470 - FLEVEL
      ?auto_23471 - CITY
      ?auto_23472 - AIRCRAFT
      ?auto_23469 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23468 ?auto_23470 ) ( not ( = ?auto_23465 ?auto_23471 ) ) ( not ( = ?auto_23470 ?auto_23468 ) ) ( PERSON-AT ?auto_23466 ?auto_23465 ) ( not ( = ?auto_23466 ?auto_23467 ) ) ( PERSON-AT ?auto_23467 ?auto_23471 ) ( AIRCRAFT-AT ?auto_23472 ?auto_23469 ) ( not ( = ?auto_23465 ?auto_23469 ) ) ( not ( = ?auto_23471 ?auto_23469 ) ) ( FUEL-LEVEL ?auto_23472 ?auto_23468 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_23467 ?auto_23465 )
      ( FLY-2PPL-VERIFY ?auto_23466 ?auto_23467 ?auto_23465 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_23483 - PERSON
      ?auto_23484 - PERSON
      ?auto_23482 - CITY
    )
    :vars
    (
      ?auto_23486 - FLEVEL
      ?auto_23485 - FLEVEL
      ?auto_23489 - CITY
      ?auto_23487 - AIRCRAFT
      ?auto_23488 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23486 ?auto_23485 ) ( not ( = ?auto_23482 ?auto_23489 ) ) ( not ( = ?auto_23485 ?auto_23486 ) ) ( PERSON-AT ?auto_23484 ?auto_23482 ) ( not ( = ?auto_23484 ?auto_23483 ) ) ( PERSON-AT ?auto_23483 ?auto_23489 ) ( AIRCRAFT-AT ?auto_23487 ?auto_23488 ) ( not ( = ?auto_23482 ?auto_23488 ) ) ( not ( = ?auto_23489 ?auto_23488 ) ) ( FUEL-LEVEL ?auto_23487 ?auto_23486 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23484 ?auto_23483 ?auto_23482 )
      ( FLY-2PPL-VERIFY ?auto_23483 ?auto_23484 ?auto_23482 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23509 - PERSON
      ?auto_23510 - PERSON
      ?auto_23511 - PERSON
      ?auto_23508 - CITY
    )
    :vars
    (
      ?auto_23513 - FLEVEL
      ?auto_23512 - FLEVEL
      ?auto_23516 - CITY
      ?auto_23514 - AIRCRAFT
      ?auto_23515 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23513 ?auto_23512 ) ( not ( = ?auto_23508 ?auto_23516 ) ) ( not ( = ?auto_23512 ?auto_23513 ) ) ( PERSON-AT ?auto_23510 ?auto_23508 ) ( not ( = ?auto_23510 ?auto_23511 ) ) ( PERSON-AT ?auto_23511 ?auto_23516 ) ( AIRCRAFT-AT ?auto_23514 ?auto_23515 ) ( not ( = ?auto_23508 ?auto_23515 ) ) ( not ( = ?auto_23516 ?auto_23515 ) ) ( FUEL-LEVEL ?auto_23514 ?auto_23513 ) ( PERSON-AT ?auto_23509 ?auto_23508 ) ( not ( = ?auto_23509 ?auto_23510 ) ) ( not ( = ?auto_23509 ?auto_23511 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23510 ?auto_23511 ?auto_23508 )
      ( FLY-3PPL-VERIFY ?auto_23509 ?auto_23510 ?auto_23511 ?auto_23508 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23527 - PERSON
      ?auto_23528 - PERSON
      ?auto_23529 - PERSON
      ?auto_23526 - CITY
    )
    :vars
    (
      ?auto_23531 - FLEVEL
      ?auto_23530 - FLEVEL
      ?auto_23534 - CITY
      ?auto_23532 - AIRCRAFT
      ?auto_23533 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23531 ?auto_23530 ) ( not ( = ?auto_23526 ?auto_23534 ) ) ( not ( = ?auto_23530 ?auto_23531 ) ) ( PERSON-AT ?auto_23527 ?auto_23526 ) ( not ( = ?auto_23527 ?auto_23528 ) ) ( PERSON-AT ?auto_23528 ?auto_23534 ) ( AIRCRAFT-AT ?auto_23532 ?auto_23533 ) ( not ( = ?auto_23526 ?auto_23533 ) ) ( not ( = ?auto_23534 ?auto_23533 ) ) ( FUEL-LEVEL ?auto_23532 ?auto_23531 ) ( PERSON-AT ?auto_23529 ?auto_23526 ) ( not ( = ?auto_23527 ?auto_23529 ) ) ( not ( = ?auto_23528 ?auto_23529 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23527 ?auto_23528 ?auto_23526 )
      ( FLY-3PPL-VERIFY ?auto_23527 ?auto_23528 ?auto_23529 ?auto_23526 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23602 - PERSON
      ?auto_23603 - PERSON
      ?auto_23604 - PERSON
      ?auto_23601 - CITY
    )
    :vars
    (
      ?auto_23606 - FLEVEL
      ?auto_23605 - FLEVEL
      ?auto_23609 - CITY
      ?auto_23607 - AIRCRAFT
      ?auto_23608 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_23606 ?auto_23605 ) ( not ( = ?auto_23601 ?auto_23609 ) ) ( not ( = ?auto_23605 ?auto_23606 ) ) ( PERSON-AT ?auto_23604 ?auto_23601 ) ( not ( = ?auto_23604 ?auto_23602 ) ) ( PERSON-AT ?auto_23602 ?auto_23609 ) ( AIRCRAFT-AT ?auto_23607 ?auto_23608 ) ( not ( = ?auto_23601 ?auto_23608 ) ) ( not ( = ?auto_23609 ?auto_23608 ) ) ( FUEL-LEVEL ?auto_23607 ?auto_23606 ) ( PERSON-AT ?auto_23603 ?auto_23601 ) ( not ( = ?auto_23602 ?auto_23603 ) ) ( not ( = ?auto_23603 ?auto_23604 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23604 ?auto_23602 ?auto_23601 )
      ( FLY-3PPL-VERIFY ?auto_23602 ?auto_23603 ?auto_23604 ?auto_23601 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_23735 - PERSON
      ?auto_23736 - PERSON
      ?auto_23737 - PERSON
      ?auto_23734 - CITY
    )
    :vars
    (
      ?auto_23739 - FLEVEL
      ?auto_23738 - FLEVEL
      ?auto_23740 - CITY
      ?auto_23741 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_23739 ?auto_23738 ) ( not ( = ?auto_23734 ?auto_23740 ) ) ( not ( = ?auto_23738 ?auto_23739 ) ) ( PERSON-AT ?auto_23737 ?auto_23734 ) ( not ( = ?auto_23737 ?auto_23736 ) ) ( PERSON-AT ?auto_23736 ?auto_23740 ) ( AIRCRAFT-AT ?auto_23741 ?auto_23734 ) ( FUEL-LEVEL ?auto_23741 ?auto_23738 ) ( PERSON-AT ?auto_23735 ?auto_23734 ) ( not ( = ?auto_23735 ?auto_23736 ) ) ( not ( = ?auto_23735 ?auto_23737 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_23737 ?auto_23736 ?auto_23734 )
      ( FLY-3PPL-VERIFY ?auto_23735 ?auto_23736 ?auto_23737 ?auto_23734 ) )
  )

)

