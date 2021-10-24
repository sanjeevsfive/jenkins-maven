//FROM openjdk:8
//ADD target/my-app-1.0-SNAPSHOT.jar my-app-1.0-SNAPSHOT.jar
//ENTRYPOINT ["java","-jar","/my-app-1.0-SNAPSHOT.jar"]
FROM openjdk:11
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
# RUN javac Main.java
CMD ["java", "Main"]
ENTRYPOINT [ "java","-jar","my-app-1.0-SNAPSHOT.jar" ] 
