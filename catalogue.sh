curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y

useradd roboshop

curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
cd /home/roboshop
rm -rf catalogue
unzip -o /tmp/catalogue.zip
mv catalogue-main catalogue
cd /home/roboshop/catalogue
npm install

sed -i -e 's/MONGO_DNSNAME/mongodb.devopsb69.online/' systemd.service

mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl restart catalogue
systemctl enable catalogue