# ais_path='Ais/ais_config.xml'
# cat $ais_path
# license_path='License/license.lic'

#  <Configuration_Entry Key="License File Path" Value="/opt/actimize/license.lic"/> 
# num=1
ais_path='config/ais_config.xml'
grep "License File Path"  $ais_path | awk -F "\"" '{print $4}' > license_path.txt
# license_path='license_path.txt'
read license_path < license_path.txt
echo "Path of license is-- ${license_path}"

grep  "expirationDate="   $license_path | awk -F "\""  ' NR==1 {print $4}' > exp_datee.txt
read exp_date < exp_datee.txt
echo "Date of License Expiry is --${exp_date}"

curr_date= date +'%Y-%m-%d'
echo $curr_date
# exp_in= date +'%m/%d/%Y'
# var= date +'%m/%d/%vY' - 04/05/2023
# $var

# echo $d1
expiring_in=$((($(date -d "$exp_date" "+%s") - $(date -d "$curr_date" "+%s")) / 86400))
echo "License expiring in -- ${expiring_in} days"

if [ $expiring_in -le 30 ]
then
 echo "Your License is going to expire in ${expiring_in} days"
else
 echo "${expiring_in} days to expire license "
fi


