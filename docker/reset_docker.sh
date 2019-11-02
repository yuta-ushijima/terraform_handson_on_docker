read -p "コンテナ/イメージ/ボリュームの全てを消去しますか？ (y/n)" initialize < /dev/tty
case $initialize in
  y|Y) docker rm -f $(docker ps -aq)
       docker rmi -f $(docker images -q)
       docker volume rm -f $(docker volume ls -q)
   ;;
esac

read -p "リビルドしますか？ (y/n)" rebuild < /dev/tty
case $rebuild in
  y|Y) docker-compose build ;;
esac
