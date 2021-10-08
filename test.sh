# Create reports folder
REPORTS_DIR=$(pwd)/$ROBOT_REPORTS_DIR
TESTS_DIR=$(pwd)/$ROBOT_TESTS_DIR
sudo mkdir $REPORTS_DIR && sudo chmod 777 $REPORTS_DIR

environment_variable_array['VE_USERNAME','VE_PASSWORD']

docker run --shm-size=$ALLOWED_SHARED_MEMORY \
  -e BROWSER=$BROWSER \
  -e ROBOT_THREADS=$ROBOT_THREADS \
  -e PABOT_OPTIONS="$PABOT_OPTIONS" \
  -e ROBOT_OPTIONS="$ROBOT_OPTIONS" \
  -e VE_USERNAME="$VE_USERNAME" \
  -e VE_PASSWORD="$VE_PASSWORD" \
  -v $REPORTS_DIR:/opt/robotframework/reports:Z \
  -v $TESTS_DIR:/opt/robotframework/tests:Z \
  --user $(id -u):$(id -g) \
  ppodgorsek/robot-framework:latest
