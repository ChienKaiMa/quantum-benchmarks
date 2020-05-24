#!/bin/bash
BINDIR="$(dirname $0)"
. $BINDIR/utils/constants.sh
. $BINDIR/utils/colors.sh

ARCH=`uname -m`

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    SYS="Linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    SYS="MacOSX"
else
    printf "${RED}system $OSTYPE not supported${NC}" >&2;
    exit 1;
fi

URL="https://repo.continuum.io/miniconda/Miniconda3-latest-$SYS-$ARCH.sh"
INSTALLER=$CONDA_PATH/Miniconda3-latest-$SYS-$ARCH.sh
printf "${BLUE}downloading miniconda installer to:${NC}\n"
printf "${BOLD}${CONDA_PATH}/Miniconda3-latest-$SYS-$ARCH.sh${NC}\n"
mkdir -p $CONDA_PATH
curl -L -o $INSTALLER $URL
chmod 755 $INSTALLER
$INSTALLER -b -f -p $CONDA_PATH
$CONDA update -n base -c defaults conda -y
$CONDA init bash
$CONDA install -y numpy matplotlib
