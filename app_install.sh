#! /usr/bin/env bash

echo Please provide the following details on your lab environment.
echo
echo "What is the address of your Mantl Control Server?  "
echo "eg: control.mantl.internet.com"
read control_address
echo
echo "What is the username for your Mantl account?  "
read mantl_user
echo
echo "What is the password for your Mantl account?  "
read -s mantl_password
echo
echo
echo "What is the Lab Application Domain?  "
read mantl_domain
echo
echo "We need some details on your Spark and Tropo Account."
echo
echo "What is your Spark Token?"
read -s spark_token
echo
echo "What is your TOKEN_TROPO_SMSEMER_TXT"
read token_tropo_smsemer_txt
echo

# need to collect other relevant info


#export MANTL_CONTROL="$control_address"
#export MANTL_USER="$mantl_user"
#export MANTL_PASSWORD="$mantl_password"

#echo "Marathon API calls will be sent to: "
#echo "https://$MANTL_CONTROL:8080/"

cp sample-spark-trak.json deploy-spark-trak.json
sed -i "" -e "s/ENV_TOKEN_SPARK_BOT/$spark_token/g" deploy-spark-trak.json
# NEED TO FILL IN OTHER REPLACEMENTS HERE

echo " "
echo "***************************************************"
echo "Installing the Spark-Track"
curl -k -X POST -u $mantl_user:$mantl_password https://$control_address:8080/v2/apps \
-H "Content-type: application/json" \
-d @deploy-spark-trak.json \
| python -m json.tool

echo "***************************************************"
echo

echo Installed

echo
echo "You can also watch the progress from the GUI at: "
echo
echo "https://$control_address/marathon"
echo