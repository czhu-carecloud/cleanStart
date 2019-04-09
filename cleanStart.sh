FOLDERS=( 'eagle_app' 'eagle_data_handler')
FOLDERS_TO_UPDATE=*/
CLEAN=false

while getopts "cf" opt; do
  case ${opt} in
    f )
      FOLDERS_TO_UPDATE=${FOLDERS[*]}
      ;;
    c )
      CLEAN=true
      ;;
    \? )
      echo "Invalid Option: -$OPTARG" 1>&2
      exit 1
      ;;
  esac
done


echo "#########################################"
echo "Updating: $FOLDERS_TO_UPDATE"
echo "#########################################"
echo ""
echo ""


# for f in ${FOLDERS[@]}
for f in $FOLDERS_TO_UPDATE
do
  cd $f
  BRANCH=$(git symbolic-ref --short HEAD)
  echo "#########################################"
  echo "updating $BRANCH of $f"
  echo "#########################################"
  git fetch
  git stash
  git pull --rebase upstream $BRANCH
  git stash apply
  echo $CLEAN
  if [ $CLEAN = true ]
  then
    rm -rf node_modules/ && rm -rf yarn.lock rm -rf package-lock.json && yarn install
  else
    yarn
  fi
  echo "#########################################"
  echo "update of $f complete!"
  echo "#########################################"
  echo ""
  echo ""
  cd ..
  
done