#! /bin/bash

source ./cyber_scan/assets/set_color.sh

function display_ascii_art()
{
	cat << "EOF"
                                                 
 @@@@@@@  @@@ @@@  @@@@@@@   @@@@@@@@  @@@@@@@   
@@@@@@@@  @@@ @@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  
!@@       @@! !@@  @@!  @@@  @@!       @@!  @@@  
!@!       !@! @!!  !@   @!@  !@!       !@!  @!@  
!@!        !@!@!   @!@!@!@   @!!!:!    @!@!!@!   
!!!         @!!!   !!!@!!!!  !!!!!:    !!@!@!    
:!!         !!:    !!:  !!!  !!:       !!: :!!   
:!:         :!:    :!:  !:!  :!:       :!:  !:!  
 ::: :::     ::     :: ::::   :: ::::  ::   :::  
 :: :: :     :     :: : ::   : :: ::    :   : :  
                                                 
                                        
 @@@@@@    @@@@@@@   @@@@@@   @@@  @@@  
@@@@@@@   @@@@@@@@  @@@@@@@@  @@@@ @@@  
!@@       !@@       @@!  @@@  @@!@!@@@  
!@!       !@!       !@!  @!@  !@!!@!@!  
!!@@!!    !@!       @!@!@!@!  @!@ !!@!  
 !!@!!!   !!!       !!!@!!!!  !@!  !!!  
     !:!  :!!       !!:  !!!  !!:  !!!  
    !:!   :!:       :!:  !:!  :!:  !:!  
:::: ::    ::: :::  ::   :::   ::   ::  
:: : :     :: :: :   :   : :  ::    :   
                                        
EOF

	echo -e "\nWelcome to this utility for monitoring information of certain addresses in the internet space."
	echo "$(set_color "yellow")P.S:$(set_color "*") On the fact of using this utility: You are solely responsible for Your actions."
	echo -e "\n@Invisible corp."
	echo "MIT License"
	echo "@All right reserved"
}
