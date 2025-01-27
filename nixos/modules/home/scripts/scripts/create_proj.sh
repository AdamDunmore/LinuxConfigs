#!/bin/sh

# A script to build a project given an argument for a languge

python() {
    mkdir ./src
    echo 'print("Hello World!")' >> ./src/main.py
    printf '#!/bin/sh\npython3 ./src/main.py' >> build.sh
    chmod +x ./build.sh
}

if [ "$1" = "" ]; then # Could maybe move to an input call
    echo "Incorrect Usage. Correct usage:"
    echo "create_proj <language>"
    exit
fi


case "$1" in
    "python")
        python;;
    *)
        echo "Language not found or not supported"
        ;;
esac
