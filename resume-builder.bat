cd /d D:\CodingSpace\resume-builder-frontend\build
start http-server -p 8081 -a localhost -c-1
start http://localhost:8081
cd /d D:\CodingSpace\resume-builder
start npm start
@REM pm2 stop npm
@REM pm2 start npm -- start
