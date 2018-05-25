while getopts f: option
do
 case "${option}"
 in
 #u) USER=${OPTARG};;
 #d) DATE=${OPTARG};;
 #p) PRODUCT=${OPTARG};;
 f) FORMAT=$OPTARG;;
 esac
done