#################################################################################
############################# DO NOT EDIT THIS FILE #############################
#################################################################################

URL=""
FILE_NAME=""
STORAGE_LOCATION=""
USER_DIR="$HOME"
STORAGE_DIR="${USER_DIR}/${STORAGE_LOCATION}"
LOCATION="${STORAGE_DIR}/${FILE_NAME}.zip"

SERVER_DIR=""
FULL_SERVER_DIR=${USER_DIR}"/"${SERVER_DIR}

if [ ! -d ${STORAGE_DIR} ]; then
  mkdir ${STORAGE_DIR}
fi

wget -O ${LOCATION} ${URL}
find ${FULL_SERVER_DIR} -maxdepth 1 -type f -name "Thermos-1.7.10*.jar" -exec rm -rf {} \;
unzip -o ${LOCATION} -d ${FULL_SERVER_DIR}
cd ${FULL_SERVER_DIR}
find . -maxdepth 1 -size +10M -type f -name "Thermos-1.7.10*.jar" -exec sh -c 'x="{}"; mv "$x" "Thermos-server.jar"' \;
rm -rf ${LOCATION}