 #!/bin/bash


while read -r server_line
do
    printf "\n============";
    printf "\nNew line:\n";
    SERVER_LINE=$server_line
    echo $SERVER_LINE;

    SERVER_ARR=(${SERVER_LINE//|/ })

    SERVER_USER=${SERVER_ARR[0]}
    SERVER_PASS=${SERVER_ARR[1]}
    SERVER_SERVER=${SERVER_ARR[2]}
    SERVER_PORT=${SERVER_ARR[3]}

    SERVER_COMMAND=${SERVER_ARR[@]:4}

    printf "\nParsing:\n";
    echo $SERVER_USER;
    echo $SERVER_PASS;
    echo $SERVER_SERVER;
    echo $SERVER_PORT;
    echo $SERVER_COMMAND;

    printf "\nConnecting ssh:\n";
    sshpass -p "$SERVER_PASS" ssh -o PubkeyAuthentication=no -o PreferredAuthentications=password -p $SERVER_PORT -l $SERVER_USER $SERVER_SERVER "$SERVER_COMMAND";

done < ./servers.txt


