COMPONENT=frontend
CONTENT="*"
source common.sh

PRINT "Install Nginx"
yum install nginx -y &>>$LOG
STAT $?

APP_LOC=/usr/share/nginx/html

DOWNLOAD_APP_CODE

mv frontend-main/static/* .

PRINT "Copy RoboShop Configuration File"
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf
STAT $?

PRINT "Update RoboShop Configuration"
sed -i -e '/catalogue/ s/localhost/dev-catalogue.devopsb69.online/'  -e '/user/ s/localhost/dev-user.devopsb69.online/' -e '/cart/ s/localhost/dev-cart.devopsb69.online/' -e '/shipping/ s/localhost/dev-shipping.devopsb69.online/' -e '/payment/ s/localhost/dev-payment.devopsb69.online/' /etc/nginx/default.d/roboshop.conf
STAT $?

PRINT "Enable Nginx Service"
systemctl enable nginx &>>$LOG
STAT $?

PRINT "Start Nginx Service"
systemctl restart nginx &>>$LOG
STAT $?

