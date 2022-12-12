echo "********** COPY FOLDER **********"
cp --force -r html/ build/

echo "********* BUILD IMAGE ***********"
docker build -t alexz2/converter_front:1.0.0 build/ -f build/Dockerfile

echo "****** PUSH TO DOCKER HUB *******"
docker push alexz2/converter_front:1.0.0
